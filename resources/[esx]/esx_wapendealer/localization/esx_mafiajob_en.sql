INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_maffia','Maffia',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_maffia','Maffia',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_maffia', 'Maffia', 1)
;

INSERT INTO `jobs` (`name`, `label`, `whitelisted`) VALUES
('maffia', 'Maffia', 1);

--
-- Déchargement des données de la table `jobs_grades`
--

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
('maffia', 0, 'soldato', 'Stagair', 1500, '{}', '{}'),
('maffia', 1, 'capo', 'Lid', 1800, '{}', '{}'),
('maffia', 2, 'consigliere', 'Raadslid', 2100, '{}', '{}'),
('maffia', 3, 'boss', 'Baas', 2700, '{}', '{}');