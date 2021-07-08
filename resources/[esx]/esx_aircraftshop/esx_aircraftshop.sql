USE `essentialmode`;

INSERT INTO `licenses` (`type`, `label`) VALUES
	('aircraft', 'Aircraft License')
;

CREATE TABLE `aircraft_categories` (
	`name` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`name`)
);

INSERT INTO `aircraft_categories` (name, label) VALUES
	('plane','Planes'),
	('heli','Helicopters')
;

CREATE TABLE `aircrafts` (
	`name` varchar(60) NOT NULL,
	`model` varchar(60) NOT NULL,
	`price` int(11) NOT NULL,
	`category` varchar(60) DEFAULT NULL,

	PRIMARY KEY (`model`)
);

INSERT INTO `aircrafts` (name, model, price, category) VALUES
	('Alpha Z1','alphaz1',1121000,'plane'),
	('Besra','besra',1000000,'plane'),
	('Cuban 800','cuban800',240000,'plane'),
	('Luxor','luxor',1500000,'plane'),
	('Mallard','stunt',250000,'plane'),
	('Mammatus','mammatus',300000,'plane'),
	('Nimbus','nimbus',900000,'plane'),
	('Rogue','rogue',1000000,'plane'),
	('Shamal','shamal',1150000,'plane'),
	('Ultra Light','microlight',50000,'plane'),
	('Velum','velum2',450000,'plane'),
	('Vestra','vestra',950000,'plane'),
	('Frogger','frogger',800000,'heli'),
	('Maverick','maverick',750000,'heli'),
	('SuperVolito','supervolito',1000000,'heli'),
	('Swift','swift',1000000,'heli'),
	('Volatus','volatus',1250000,'heli')
;
