CREATE DATABASE `soccer_data` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `soccer_data`;
CREATE TABLE `dim_event` (
  `event_key` bigint(20) NOT NULL AUTO_INCREMENT,
  `event_type` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`event_key`)
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8;

CREATE TABLE `dim_game_date` (
  `game_date_key` bigint(20) NOT NULL AUTO_INCREMENT,
  `game_date` date DEFAULT NULL,
  `game_year` int(11) DEFAULT NULL,
  `game_date_day` int(11) DEFAULT NULL,
  `game_month` int(11) DEFAULT NULL,
  `game_date_gen` varchar(200) DEFAULT NULL,
  `home_team` varchar(200) DEFAULT NULL,
  `away_team` varchar(200) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`game_date_key`),
  UNIQUE KEY `idx_dim_game_date_pk` (`game_date_key`),
  KEY `idx_dim_game_date_lookup` (`game_date`,`game_year`,`game_date_day`,`game_month`,`game_date_gen`,`home_team`,`away_team`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

CREATE TABLE `dim_location` (
  `location_key` bigint(20) NOT NULL AUTO_INCREMENT,
  `x` varchar(200) DEFAULT NULL,
  `y` varchar(200) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`location_key`),
  UNIQUE KEY `idx_dim_location_pk` (`location_key`),
  KEY `idx_dim_location_lookup` (`x`,`y`)
) ENGINE=InnoDB AUTO_INCREMENT=250301 DEFAULT CHARSET=utf8;

CREATE TABLE `dim_period` (
  `period_key` bigint(20) NOT NULL AUTO_INCREMENT,
  `time_from_zero` int(11) DEFAULT NULL,
  `period_desc` varchar(200) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`period_key`),
  UNIQUE KEY `idx_dim_period_pk` (`period_key`),
  KEY `idx_dim_period_lookup` (`period_desc`,`time_from_zero`)
) ENGINE=InnoDB AUTO_INCREMENT=6009 DEFAULT CHARSET=utf8;

CREATE TABLE `dim_player` (
  `player_key` bigint(20) NOT NULL AUTO_INCREMENT,
  `player_name` varchar(200) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`player_key`),
  UNIQUE KEY `idx_dim_player_pk` (`player_key`),
  KEY `idx_dim_player_lookup` (`player_name`)
) ENGINE=InnoDB AUTO_INCREMENT=321 DEFAULT CHARSET=utf8;

CREATE TABLE `dim_team` (
  `team_key` bigint(20) NOT NULL AUTO_INCREMENT,
  `player_1_team_gen` varchar(200) DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`team_key`),
  UNIQUE KEY `idx_dim_team_pk` (`team_key`),
  KEY `idx_dim_team_lookup` (`player_1_team_gen`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

CREATE TABLE `fact_event` (
  `player_key` bigint(20) DEFAULT NULL,
  `event_key` bigint(20) DEFAULT NULL,
  `game_date_key` bigint(20) DEFAULT NULL,
  `period_key` bigint(20) DEFAULT NULL,
  `is_offensive` varchar(13) DEFAULT NULL,
  `team_key` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;





