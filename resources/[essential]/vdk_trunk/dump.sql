-- Export de la structure de la table gta5_gamemode_essential. vehicle_inventory
CREATE TABLE IF NOT EXISTS `vehicle_inventory` (
  `plate` varchar(50) NOT NULL,
  `item` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
