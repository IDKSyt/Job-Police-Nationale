INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_police', 'Police Nationale', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_police', 'Police Nationale', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_police', 'Police Nationale', 1)
;

INSERT INTO `jobs` (`name`, `label`) VALUES
	('police', 'Police Nationale')
;

INSERT INTO `job_grades` (`job_name`, `grade`, `name`, `label`, `salary`, `skin_male`, `skin_female`) VALUES
	('police', 0, 'ads', 'Adjoint de Sécurité', 100, '{}', '{}'),
	('police', 1, 'eg', 'Elève Gardien', 200, '{}', '{}'),
	('police', 2, 'gdlps', 'Gardien de la Paix Stagiaire', 350, '{}', '{}'),
	('police', 3, 'gdlp', 'Gardien de la Paix', 360, '{}', '{}'),
	('police', 4, 'brg', 'Brigadier', 370, '{}', '{}'),
	('police', 5, 'brc', 'Brigadier-Chef', 380, '{}', '{}'),
	('police', 6, 'brgmaj', 'Brigadier-Major', 390, '{}', '{}'),
	('police', 7, 'sltn', 'Sous-Lieutenant', 460, '{}', '{}'),
	('police', 8,'ltn','lieutenant', 500, '{}', '{}'),
	('police', 9,'cpt','Capitaine', 500, '{}', '{}'),
	('police', 10,'cmd','Commandant', 500, '{}', '{}'),
	('police', 11,'cdp','Commissaire de Police', 500, '{}', '{}'),
    	('police', 12,'boss','Commissaire Divisionnaire', 510, '{}', '{}');