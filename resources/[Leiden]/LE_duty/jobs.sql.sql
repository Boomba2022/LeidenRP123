INSERT INTO `jobs` (name, label) VALUES
  ('offpolice','Off-Duty'),
  ('offmechanic','Off-Duty'),
  ('offambulance','Off-Duty')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
  ('offpolice',0,'recruit','Aspirant',500,'{}','{}'),
  ('offpolice',1,'officer','Surveillant',500,'{}','{}'),
  ('offpolice',2,'sergeant','Agent',500,'{}','{}'),
  ('offpolice',3,'base','Hoofd-Agent',500,'{}','{}'),
  ('offpolice',4,'boos','Brigadier',500,'{}','{}'),
  ('offpolice',5,'lieutenant','Inspecteur',500,'{}','{}'),
  ('offpolice',6,'bass','Hoofdinspecteur',500,'{}','{}'),
  ('offpolice',7,'baas','Hoofdcommissaris',500,'{}','{}'),
  ('offpolice',8,'boss','Eerste Hoofdcommissaris',500,'{}','{}'),
  ('offmechanic',0,'recrue','stagaire',500,'{}','{}'),
  ('offmechanic',1,'novice','Gevorderde',500,'{}','{}'),
  ('offmechanic',2,'experimente','Experimente',500,'{}','{}'),
  ('offmechanic',3,'chief','Leider',500,'{}','{}'),
  ('offmechanic',4,'boss','baas',500,'{}','{}'),
  ('offambulance',0,'ambulance','Ambulancier',500,'{}','{}'),
  ('offambulance',1,'doctor','Medecin',500,'{}','{}'),
  ('offambulance',2,'chief_doctor','Medecin-chef',500,'{}','{}'),
  ('offambulance',3,'boss','Chirurgien',500,'{}','{}')
;