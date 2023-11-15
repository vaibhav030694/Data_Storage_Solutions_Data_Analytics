ALTER TABLE ipl_sch.matches_fact
DROP CONSTRAINT fk_fixture_id;

ALTER TABLE ipl_sch.matches_fact
DROP CONSTRAINT fk_team_id;

ALTER TABLE ipl_sch.matches_fact
DROP CONSTRAINT fk_umpire_id;

ALTER TABLE ipl_sch.matches_fact
DROP CONSTRAINT fk_venue_id;



DROP TABLE ipl_sch.matches_fixtures_dim;
DROP TABLE ipl_sch.teams_dim;
DROP TABLE ipl_sch.umpire_dim;
DROP TABLE ipl_sch.venue_dim;
DROP TABLE ipl_sch.[ipl_stage];
DROP TABLE ipl_sch.matches_fact;

----------------------------------------------------------------------------------------------------
-- matches_fixtures_dim
USE [IPL_DB]
GO

/****** Object:  Table [ipl_sch].[matches_fixtures_dim]    Script Date: 06-04-2023 11.13.20 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ipl_sch].[matches_fixtures_dim](
	[fixture_id] [int] IDENTITY(100,1) NOT NULL,
	[match_date] [varchar](150) NULL,
	[season_year] [varchar](150) NULL,
 CONSTRAINT [pk_fixure_id] PRIMARY KEY CLUSTERED 
(
	[fixture_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


----------------------------------------------------------------------------------------------------

USE [IPL_DB]
GO

/****** Object:  Table [ipl_sch].[teams_dim]    Script Date: 06-04-2023 11.14.54 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ipl_sch].[teams_dim](
	[team_id] [int] IDENTITY(200,1) NOT NULL,
	[team1] [varchar](150) NULL,
	[team2] [varchar](150) NULL,
 CONSTRAINT [pk_team_id] PRIMARY KEY CLUSTERED 
(
	[team_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [ipl_sch].[teams_dim]  WITH CHECK ADD CHECK  (([team1]='Delhi Capitals' OR [team1]='Rising Pune Supergiants' OR [team1]='Pune Warriors' OR [team1]='Kochi Tuskers Kerala' OR [team1]='Deccan Chargers' OR [team1]='Rajasthan Royals' OR [team1]='Chennai Super Kings' OR [team1]='Kings XI Punjab' OR [team1]='Delhi Daredevils' OR [team1]='Kolkata Knight Riders' OR [team1]='Royal Challengers Bangalore' OR [team1]='Rising Pune Supergiant' OR [team1]='Gujarat Lions' OR [team1]='Mumbai Indians' OR [team1]='Sunrisers Hyderabad'))
GO

ALTER TABLE [ipl_sch].[teams_dim]  WITH CHECK ADD CHECK  (([team2]='Delhi Capitals' OR [team2]='Rising Pune Supergiants' OR [team2]='Pune Warriors' OR [team2]='Kochi Tuskers Kerala' OR [team2]='Deccan Chargers' OR [team2]='Rajasthan Royals' OR [team2]='Chennai Super Kings' OR [team2]='Kings XI Punjab' OR [team2]='Delhi Daredevils' OR [team2]='Kolkata Knight Riders' OR [team2]='Royal Challengers Bangalore' OR [team2]='Rising Pune Supergiant' OR [team2]='Gujarat Lions' OR [team2]='Mumbai Indians' OR [team2]='Sunrisers Hyderabad'))
GO


----------------------------------------------------------------------------------------------------

USE [IPL_DB]
GO

/****** Object:  Table [ipl_sch].[umpire_dim]    Script Date: 06-04-2023 11.15.12 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ipl_sch].[umpire_dim](
	[umpire_id] [int] IDENTITY(100,1) NOT NULL,
	[umpire1] [varchar](150) NULL,
	[umpire2] [varchar](150) NULL,
	[umpire3] [varchar](150) NULL,
 CONSTRAINT [pk_umpire_id] PRIMARY KEY CLUSTERED 
(
	[umpire_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

----------------------------------------------------------------------------------------------------

USE [IPL_DB]
GO

/****** Object:  Table [ipl_sch].[venue_dim]    Script Date: 06-04-2023 11.15.42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ipl_sch].[venue_dim](
	[venue_id] [int] IDENTITY(400,1) NOT NULL,
	[city] [varchar](200) NULL,
	[stadium_name] [varchar](250) NULL,
 CONSTRAINT [pk_venue_id] PRIMARY KEY CLUSTERED 
(
	[venue_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


----------------------------------------------------------------------------------------------------

-- ipl_stage
USE [IPL_DB]
GO

/****** Object:  Table [ipl_sch].[ipl_stage]    Script Date: 06-04-2023 11.13.42 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ipl_sch].[ipl_stage](
	[id] [int] NOT NULL,
	[season] [nvarchar](100) NULL,
	[fixture_id] [int] NULL,
	[date] [nvarchar](100) NULL,
	[city] [nvarchar](100) NULL,
	[team_id] [int] NULL,
	[team1] [nvarchar](100) NULL,
	[team2] [nvarchar](100) NULL,
	[toss_winner] [nvarchar](100) NULL,
	[toss_decision] [nvarchar](100) NULL,
	[result] [nvarchar](100) NULL,
	[dl_applied] [nvarchar](100) NULL,
	[winner] [nvarchar](100) NULL,
	[win_by_runs] [nvarchar](100) NULL,
	[win_by_wickets] [nvarchar](100) NULL,
	[player_of_match] [nvarchar](100) NULL,
	[venue_id] [int] NULL,
	[venue] [nvarchar](100) NULL,
	[umpire_id] [int] NULL,
	[umpire1] [nvarchar](100) NULL,
	[umpire2] [nvarchar](100) NULL,
	[umpire3] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

----------------------------------------------------------------------------------------------------
-- matches_fact
USE [IPL_DB]
GO

/****** Object:  Table [ipl_sch].[matches_fact]    Script Date: 06-04-2023 11.12.33 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [ipl_sch].[matches_fact](
	[match_id] [int] IDENTITY(300,1) NOT NULL,
	[game_id] [int] NOT NULL,
	[team_id] [int] NULL,
	[umpire_id] [int] NULL,
	[fixture_id] [int] NULL,
	[venue_id] [int] NULL,
	[toss_winner] [varchar](150) NULL,
	[match_winner] [varchar](150) NULL,
	[player_of_match] [varchar](150) NULL,
	[win_by_wickets] [int] NULL,
	[win_by_runs] [int] NULL,
	[result] [varchar](100) NULL,
 CONSTRAINT [pk_match_id] PRIMARY KEY CLUSTERED 
(
	[match_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [ipl_sch].[matches_fact]  WITH CHECK ADD  CONSTRAINT [fk_fixture_id] FOREIGN KEY([fixture_id])
REFERENCES [ipl_sch].[matches_fixtures_dim] ([fixture_id])
GO

ALTER TABLE [ipl_sch].[matches_fact] CHECK CONSTRAINT [fk_fixture_id]
GO

ALTER TABLE [ipl_sch].[matches_fact]  WITH CHECK ADD  CONSTRAINT [fk_team_id] FOREIGN KEY([team_id])
REFERENCES [ipl_sch].[teams_dim] ([team_id])
GO

ALTER TABLE [ipl_sch].[matches_fact] CHECK CONSTRAINT [fk_team_id]
GO

ALTER TABLE [ipl_sch].[matches_fact]  WITH CHECK ADD  CONSTRAINT [fk_umpire_id] FOREIGN KEY([umpire_id])
REFERENCES [ipl_sch].[umpire_dim] ([umpire_id])
GO

ALTER TABLE [ipl_sch].[matches_fact] CHECK CONSTRAINT [fk_umpire_id]
GO

ALTER TABLE [ipl_sch].[matches_fact]  WITH CHECK ADD  CONSTRAINT [fk_venue_id] FOREIGN KEY([venue_id])
REFERENCES [ipl_sch].[venue_dim] ([venue_id])
GO

ALTER TABLE [ipl_sch].[matches_fact] CHECK CONSTRAINT [fk_venue_id]
GO

ALTER TABLE [ipl_sch].[matches_fact]  WITH CHECK ADD CHECK  (([result]='tie' OR [result]='normal' OR [result]='no result'))
GO

----------------------------------------------------------------------------------------------------

-- Query 1 :

select sum(mf.win_by_runs) as Total_runs_by_MI from ipl_sch.matches_fact mf, ipl_sch.teams_dim td
where mf.team_id = td.team_id and team1 = 'Mumbai Indians';

----------------------------------------------------------------------------------------------------

-- Query 2
select ud.umpire2 from ipl_sch.matches_fact mf, ipl_sch.venue_dim vd, ipl_sch.umpire_dim ud
where mf.venue_id = vd.venue_id and mf.umpire_id = ud.umpire_id and vd.city = 'Mumbai';


----------------------------------------------------------------------------------------------------

-- Query 3

select td.team1,td.team2,COUNT(mf.match_id) AS Team_matches_played_count from ipl_sch.matches_fact mf, ipl_sch.teams_dim td
where mf.team_id = td.team_id GROUP BY td.team1,td.team2;


----------------------------------------------------------------------------------------------------

-- Query 4

select mf.match_id from ipl_sch.matches_fact mf where mf.win_by_wickets > 5;

----------------------------------------------------------------------------------------------------

-- Query 5

select top 5 mf.match_id from ipl_sch.matches_fact mf where mf.player_of_match='Rashid Khan'
ORDER BY mf.win_by_runs DESC;

----------------------------------------------------------------------------------------------------

-- QUERY 6

select avg(convert(float, mf.win_by_wickets)) AS AVG_OF_WIN_BY_WICKETS_BY_MI from ipl_sch.matches_fact mf 
where mf.match_winner = 'Mumbai Indians';

----------------------------------------------------------------------------------------------------

-- QUERY 7

select * from ipl_sch.matches_fact mf, ipl_sch.venue_dim vd, ipl_sch.teams_dim td 
where mf.venue_id = vd.venue_id and mf.team_id = td.team_id;