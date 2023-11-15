//Creating nodes and bulk insert data from CSV

LOAD CSV WITH HEADERS FROM 'file:///matches_fact.csv' as row CREATE (mf:matches_fact) SET mf=row
LOAD CSV WITH HEADERS FROM 'file:///venue_dim.csv' as row CREATE (vd:venue_dim) SET vd=row
LOAD CSV WITH HEADERS FROM 'file:///umpire_dim.csv' as row CREATE (ud:umpire_dim) SET ud=row
LOAD CSV WITH HEADERS FROM 'file:///teams_dim.csv' as row CREATE (td:teams_dim) SET td=row
LOAD CSV WITH HEADERS FROM 'file:///matches_fixtures_dim.csv' as row CREATE (mfd:matches_fixtures_dim) SET mfd=row


//Creating index on primary key

CREATE INDEX FOR (mf:matches_fact) ON (mf.match_id)
CREATE INDEX FOR (vd:venue_dim) ON (vd.venue_id)
CREATE INDEX FOR (um:umpire_dim) ON (um.umpire_id)
CREATE INDEX FOR (td:teams_dim) ON (td.team_id)
CREATE INDEX FOR (mfd:matches_fixtures_dim) ON (mfd.fixture_id)


//Creating relationship between nodes

MATCH (mf:matches_fact),(td:teams_dim) WHERE mf.team_id=td.team_id
CREATE (mf) - [r:HAS_TEAM] -> (td)
RETURN mf,td

MATCH (mf:matches_fact),(vd:venue_dim) WHERE mf.venue_id=td.venue_id
CREATE (mf) - [r:HAS_VENUE] -> (vd)
RETURN mf,vd

MATCH (mf:matches_fact),(ud:umpire_dim) WHERE mf.umpire_id=ud.umpire_id
CREATE (mf) - [r:HAS_UMPIRE] -> (ud)
RETURN mf,ud


//CQL queries to compare to SQL queries

// 1
MATCH (mf:matches_fact)-[:HAS_TEAM]->(t:teams_dim {team1: 'Mumbai Indians'})
RETURN sum(tofloat(mf.win_by_runs)) AS Total_runs_by_RR;

// 2
MATCH ((mf:matches_fact)-[:HAS_UMPIRE]->(ud:umpire_dim)), ((mf:matches_fact)-[:HAS_VENUE] ->(vd:venue_dim)) WHERE vd.city = 'Mumbai' RETURN ud.umpire2;

//3
MATCH ((mf:matches_fact) - [:HAS_TEAM] ->(td:teams_dim)) RETURN td.team1,td.team2, COUNT(mf.match_id) AS Team_matches_played_count;

//4
MATCH (mf:matches_fact) WHERE tofloat(mf.win_by_wickets) > 5 RETURN mf.match_id;

//5
MATCH(mf:matches_fact) where mf.player_of_match='Rashid Khan' return mf.match_id, mf.match_winner ORDER BY mf.win_by_runs DESC LiMIT 5;

//6
MATCH (mf:matches_fact) where mf.match_winner= "Mumbai Indians" RETURN AVG(tofloat(mf.win_by_wickets)) AS AVG_OF_WIN_BY_WICKETS_BY_MI;

//7
MATCH ((mf:matches_fact)-[:HAS_VENUE]->(vd:venue_dim)),((mf:matches_fact)-[:HAS_TEAM]->(td:teams_dim))
WHERE mf.venue_id=vd.venue_id AND mf.team_id=td.team_id
RETURN mf,vd,td;