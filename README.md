# MySqlConnector
Demo Connector to get, store and update information from MySQL db

It is a connection for basic get, store and update information. For using this connector you have to create a table with following DDL:

CREATE TABLE `test` (
  `id` varchar(20) NOT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) 
