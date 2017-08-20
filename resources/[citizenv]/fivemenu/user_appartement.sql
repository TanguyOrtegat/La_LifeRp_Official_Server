DROP TABLE IF EXISTS `user_appartement`;
CREATE TABLE `user_appartement` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0',
  `dirtymoney` int(11) NOT NULL DEFAULT '0',
  `lock` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `appartement_item`;
CREATE TABLE `appartement_item` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) not null default '0'
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

ALTER TABLE `user_appartement`
  ADD PRIMARY KEY (`id`);
  
  ALTER TABLE `appartement_item`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `user_appartement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
  
  ALTER TABLE `appartement_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
  
/*    DROP TABLE IF EXISTS `entreprise`;
CREATE TABLE `entreprise` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` int(11) NOT NULL DEFAULT '0',
  `dirtymoney` int(11) NOT NULL DEFAULT '0',
  `lock` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `entreprise_item`;
CREATE TABLE `entreprise_item` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item_id` int(11) NOT NULL,
  `qty` int(11) not null default '0'
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=latin1;
*/
/*  
    ALTER TABLE `entreprise`
  ADD PRIMARY KEY (`id`);
  
    ALTER TABLE `entreprise_item`
  ADD PRIMARY KEY (`id`);
  
  ALTER TABLE `entreprise`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
  ALTER TABLE `entreprise_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1;
  
 */ 
/*#INSERT INTO entreprise (`name`) VALUES ("Entreprise depanneur");
#INSERT INTO entreprise (`name`) VALUES ("Entreprise taxi");
  
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","1","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","2","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","3","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","4","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","5","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","6","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","7","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","8","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","9","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","10","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","11","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","12","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","13","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","14","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","15","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","16","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","17","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","18","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","19","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","20","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","21","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","22","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","23","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","24","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","25","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","26","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","27","0");
INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise depanneur","28","0");

#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","1","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","2","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","3","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","4","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","5","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","6","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","7","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","8","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","9","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","10","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","11","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","12","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","13","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","14","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","15","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","16","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","17","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","18","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","19","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","20","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","21","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","22","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","23","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","24","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","25","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","26","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","27","0");
#INSERT INTO entreprise_item (`name`,`item_id`,`qty`) VALUES ("Entreprise taxi","28","0");*/