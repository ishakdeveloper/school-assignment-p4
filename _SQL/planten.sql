SET NAMES utf8;
DROP DATABASE IF EXISTS planten;
CREATE DATABASE planten DEFAULT CHARACTER SET = utf8;
USE planten;

#CREATE USER 'plant'@'localhost' IDENTIFIED BY 'plant';
#GRANT ALL PRIVILEGES ON planten.* TO 'plant'@'localhost';

SET NAMES utf8;

CREATE TABLE bestelling (
  bestelnr INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  levcode INTEGER UNSIGNED NOT NULL REFERENCES leverancier(levcode),
  besteldatum DATETIME,
  leverdatum DATETIME,
  bedrag DOUBLE,
  PRIMARY KEY (bestelnr)
);

CREATE TABLE bestelregel (
  bestelnr INTEGER UNSIGNED NOT NULL REFERENCES bestelling(bestelnr),
  artcodelev VARCHAR(5) NOT NULL REFERENCES leverancier_assortiment(artcodelev),
  aantal INTEGER UNSIGNED,
  bestelprijs DOUBLE,
  PRIMARY KEY (bestelnr, artcodelev)
);

CREATE TABLE leverancier (
  levcode INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  levnaam VARCHAR(20) NOT NULL,
  levadres VARCHAR(25) NOT NULL,
  levwoonplaats VARCHAR(15) NOT NULL,
  PRIMARY KEY (levcode)
);

CREATE TABLE leverancier_assortiment (
  levcode INTEGER UNSIGNED NOT NULL REFERENCES leverancier(levcode),
  artcodelev VARCHAR(5) NOT NULL,
  plantcode INTEGER UNSIGNED NOT NULL REFERENCES plant(plantcode),
  levertijd SMALLINT UNSIGNED,
  prijs DOUBLE,
  PRIMARY KEY (levcode, artcodelev)
);

CREATE TABLE plant (
  plantcode INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  plantnaam VARCHAR(16) NOT NULL,
  soort VARCHAR(7),
  kleur VARCHAR(7),
  hoogte INTEGER UNSIGNED,
  bloeitijd_start TINYINT UNSIGNED,
  bloeitijd_einde TINYINT UNSIGNED,
  prijs DOUBLE,
  PRIMARY KEY (plantcode)
);

CREATE TABLE plantschema (
  categorie VARCHAR(12),
  minimumhoogte INTEGER UNSIGNED,
  maximumhoogte INTEGER UNSIGNED,
  afstand SMALLINT UNSIGNED
);



INSERT INTO bestelling (BESTELNR, LEVCODE, BESTELDATUM, LEVERDATUM, BEDRAG) VALUES
(121, 13, '2012-01-17 00:00:00', '2012-01-31 00:00:00', '590.45'),
(174,  4, '2012-02-25 00:00:00', '2012-03-04 00:00:00', '117.5'),
(175,  4, '2012-02-27 00:00:00', '2012-03-06 00:00:00', '395.51'),
(181,  9, '2012-03-06 00:00:00', '2012-03-27 00:00:00', '577.22'),
(184, 22, '2012-03-06 00:00:00', '2012-03-16 00:00:00', '240.0'),
(186, 20, '2012-03-11 00:00:00', '2012-03-18 00:00:00', '414.05'),
(190, 14, '2012-03-13 00:00:00', '2012-03-23 00:00:00', '659.84'),
(191, 13, '2012-03-13 00:00:00', '2012-03-27 00:00:00', '1211.4'),
(192, 35, '2012-03-13 00:00:00', '2012-03-23 00:00:00', '317.52'),
(197, 35, '2012-03-14 00:00:00', '2012-03-23 00:00:00', '928.27'),
(200,  4, '2012-03-14 00:00:00', '2012-03-21 00:00:00', '72.0'),
(201,  4, '2012-03-26 00:00:00', '2012-04-02 00:00:00', '221.25'),
(202, 14, '2012-03-26 00:00:00', '2012-04-05 00:00:00', '530.43'),
(203, 19, '2012-04-01 00:00:00', '2012-04-15 00:00:00', '556.6'),
(204, 34, '2012-04-01 00:00:00', '2012-04-15 00:00:00', '492.53');

INSERT INTO bestelregel (BESTELNR, ARTCODELEV, AANTAL, BESTELPRIJS) VALUES
(121, 'A154', '150.0', '0.45'),
(121, 'B006', '150.0', '0.95'),
(121, 'B111', '25.0', '2.25'),
(121, 'B396', '50.0', '1.65'),
(121, 'E098', '50.0', '1.9'),
(121, 'G202', '25.0', '6.35'),
(174, 'A421', '50.0', '1.35'),
(174, 'B148', '25.0', '0.65'),
(174, 'B331', '25.0', '0.7'),
(174, 'C274', '25.0', '0.65'),
(175, 'A004', '50.0', '0.75'),
(175, 'A075', '250.0', '0.25'),
(175, 'A103', '400.0', '0.2'),
(175, 'A184', '50.0', '0.45'),
(175, 'A385', '100.0', '0.4'),
(175, 'A421', '50.0', '0.8'),
(175, 'B148', '50.0', '0.45'),
(175, 'B331', '10.0', '0.45'),
(175, 'B337', '100.0', '0.7'),
(175, 'C274', '25.0', '0.45'),
(175, 'D225', '25.0', '0.35'),
(181, '44', '10.0', '3.6'),
(181, '45', '5.0', '7.2'),
(181, '99', '20.0', '6.05'),
(181, '114', '3.0', '9.45'),
(181, '116', '25.0', '15.45'),
(184, 'E-003', '200.0', '1.2'),
(186, '162', '100.0', '0.65'),
(186, '281', '100.0', '3.25'),
(190, '001-2', '100.0', '1.15'),
(190, '103-2', '100.0', '1.0'),
(190, '118-V', '200.0', '1.15'),
(190, '209-V', '25.0', '1.6'),
(190, '255-1', '200.0', '0.35'),
(190, '263-V', '50.0', '1.65'),
(190, '281-2', '25.0', '0.55'),
(190, '393-V', '20.0', '1.45'),
(191, 'A101', '100.0', '1.1'),
(191, 'A103', '1000.0', '0.1'),
(191, 'A154', '100.0', '0.5'),
(191, 'A472', '250.0', '0.6'),
(191, 'B101', '50.0', '0.4'),
(191, 'B111', '50.0', '2.15'),
(191, 'B396', '50.0', '1.5'),
(191, 'B578', '10.0', '11.7'),
(191, 'C051', '10.0', '7.55'),
(191, 'D029', '15.0', '6.0'),
(191, 'D296', '10.0', '7.55'),
(191, 'D742', '25.0', '2.95'),
(191, 'E098', '50.0', '1.8'),
(191, 'G001', '25.0', '1.2'),
(191, 'G430', '30.0', '2.75'),
(191, 'H510', '40.0', '1.75'),
(192, 'ST1P1', '100.0', '1.65'),
(192, 'ST2P1', '25.0', '1.35'),
(192, 'ST4P5', '12.0', '0.9'),
(197, 'ST1P9', '50.0', '3.75'),
(197, 'ST2P1', '25.0', '1.45'),
(197, 'ST2P6', '50.0', '2.3'),
(197, 'ST3P1', '36.0', '4.85'),
(197, 'ST4P1', '48.0', '8.95'),
(197, 'ST4P5', '24.0', '1.0'),
(200, 'A004', '25.0', '1.25'),
(200, 'A184', '25.0', '0.65'),
(200, 'B148', '25.0', '0.7'),
(200, 'B331', '10.0', '0.7'),
(201, 'A004', '25.0', '1.25'),
(201, 'A184', '25.0', '0.7'),
(201, 'A385', '25.0', '0.7'),
(201, 'A421', '50.0', '1.45'),
(201, 'B148', '25.0', '0.7'),
(201, 'B331', '25.0', '0.75'),
(201, 'C274', '25.0', '0.75'),
(201, 'D225', '50.0', '0.55'),
(202, '162-V', '75.0', '1.35'),
(202, '201-V', '25.0', '2.4'),
(202, '255-1', '150.0', '0.4'),
(202, '327-1', '150.0', '0.5'),
(202, '408-V', '100.0', '2.05'),
(202, '498-1', '100.0', '0.4'),
(203, 'ALTH', '25.0', '1.15'),
(203, 'CENT', '50.0', '1.15'),
(203, 'CYNO', '50.0', '1.4'),
(203, 'GYPS', '25.0', '2.65'),
(203, 'KNIP', '50.0', '2.05'),
(203, 'LUPI', '200.0', '1.4'),
(204, 'ALTH', '50.0', '1.0'),
(204, 'BEGO', '50.0', '0.35'),
(204, 'CAMP', '150.0', '1.55'),
(204, 'CHEI', '50.0', '0.95'),
(204, 'DELP', '100.0', '1.5');

INSERT INTO leverancier (LEVCODE, LEVNAAM, LEVADRES, LEVWOONPLAATS) VALUES
('4', 'HOVENIER G.H.', 'ZANDWEG 50', 'LISSE'),
('9', 'BAUMGARTEN R.', 'TAKSTRAAT 13', 'HILLEGOM'),
('11', 'STRUIK BV.', 'BESSENLAAN 1', 'LISSE'),
('13', 'SPITMAN EN ZN.', 'ACHTERTUIN 9', 'AALSMEER'),
('14', 'DEZAAIER L.J.A.', 'DE GRONDEN 101', 'LISSE'),
('19', 'MOOIWEER FA', 'VERLENGDE ZOMERSTR. 24', 'AALSMEER'),
('20', 'BLOEM L.Z.H.W.', 'LINNAEUSHOF 17', 'HILLEGOM'),
('21', 'TRA A.', 'KOELEPLEKSTRAAT 10', 'LISSE'),
('22', 'ERICA BV.', 'BERKENWEG 87', 'HEEMSTEDE'),
('34', 'DE GROENE KAS BV.', 'GLASWEG 1', 'AALSMEER'),
('35', 'FLORA BV.', 'OEVERSTRAAT 76', 'AALSMEER');


INSERT INTO leverancier_assortiment (LEVCODE, ARTCODELEV, PLANTCODE, LEVERTIJD, PRIJS) VALUES
('4', 'A004', '36', '7.0', '1.1'),
('4', 'A075', '426', '7.0', '0.35'),
('4', 'A103', '157', '7.0', '0.3'),
('4', 'A184', '478', '7.0', '0.6'),
('4', 'A385', '95', '7.0', '0.6'),
('4', 'A421', '455', '7.0', '1.2'),
('4', 'B148', '380', '7.0', '0.6'),
('4', 'B331', '102', '7.0', '0.6'),
('4', 'B337', '74', '7.0', '1.1'),
('4', 'C274', '470', '7.0', '0.6'),
('4', 'D225', '434', '7.0', '0.5'),
('9', '2', '498', '21.0', '2.95'),
('9', '11', '420', '21.0', '9.9'),
('9', '13', '195', '21.0', '6.55'),
('9', '14', '104', '21.0', '7.9'),
('9', '21', '364', '21.0', '2.25'),
('9', '23', '408', '21.0', '10.15'),
('9', '24', '103', '21.0', '7.9'),
('9', '29', '117', '21.0', '2.5'),
('9', '44', '257', '21.0', '3.4'),
('9', '45', '397', '21.0', '6.75'),
('9', '50', '1', '21.0', '8.8'),
('9', '64', '393', '21.0', '4.3'),
('9', '78', '286', '21.0', '10.15'),
('9', '81', '178', '21.0', '3.4'),
('9', '85', '471', '21.0', '4.5'),
('9', '91', '27', '21.0', '7.9'),
('9', '97', '210', '21.0', '0.2'),
('9', '99', '362', '21.0', '5.65'),
('9', '103', '66', '21.0', '6.1'),
('9', '114', '209', '21.0', '8.8'),
('9', '115', '281', '21.0', '5.65'),
('9', '116', '263', '21.0', '14.4'),
('9', '145', '162', '21.0', '4.3'),
('11', 'E01R', '335', '21.0', '2.9'),
('11', 'E05R', '365', '10.0', '0.8'),
('11', 'E11X', '327', '10.0', '1.05'),
('11', 'E23W', '255', '10.0', '1.05'),
('11', 'H09', '408', '14.0', '11.95'),
('11', 'H10R', '1', '14.0', '10.35'),
('11', 'H14R', '397', '14.0', '7.95'),
('11', 'H14W', '195', '14.0', '7.7'),
('11', 'H17', '117', '14.0', '2.9'),
('11', 'H190', '103', '14.0', '9.3'),
('11', 'H75P', '12', '14.0', '10.35'),
('11', 'H99G', '263', '14.0', '16.95'),
('13', 'A002', '67', '10.0', '1.45'),
('13', 'A101', '36', '7.0', '1.15'),
('13', 'A103', '184', '7.0', '0.1'),
('13', 'A154', '314', '7.0', '0.5'),
('13', 'A230', '372', '10.0', '1.65'),
('13', 'A395', '82', '10.0', '2.3'),
('13', 'A472', '383', '7.0', '0.65'),
('13', 'A520', '391', '10.0', '1.3'),
('13', 'A677', '437', '10.0', '1.3'),
('13', 'B024', '393', '14.0', '6.2'),
('13', 'B101', '123', '7.0', '0.4'),
('13', 'B111', '422', '10.0', '2.3'),
('13', 'B396', '311', '10.0', '1.65'),
('13', 'B578', '1', '14.0', '12.7'),
('13', 'C051', '281', '14.0', '8.15'),
('13', 'C119', '262', '14.0', '6.2'),
('13', 'C243', '200', '14.0', '11.4'),
('13', 'D029', '471', '14.0', '6.5'),
('13', 'D296', '362', '14.0', '8.15'),
('13', 'D321', '56', '10.0', '1.65'),
('13', 'D555', '47', '14.0', '12.7'),
('13', 'D742', '364', '14.0', '3.25'),
('13', 'E098', '87', '10.0', '1.95'),
('13', 'E409', '228', '10.0', '1.3'),
('13', 'F342', '300', '10.0', '6.2'),
('13', 'F823', '332', '10.0', '1.65'),
('13', 'G001', '71', '10.0', '1.3'),
('13', 'G202', '31', '14.0', '6.5'),
('13', 'G430', '312', '10.0', '2.95'),
('13', 'H510', '316', '10.0', '1.95'),
('14', '001-2', '455', '10.0', '1.15'),
('14', '012-V', '212', '10.0', '1.7'),
('14', '027-V', '372', '10.0', '1.45'),
('14', '067-V', '384', '10.0', '2.0'),
('14', '082-V', '297', '10.0', '1.15'),
('14', '103-2', '23', '10.0', '1.05'),
('14', '117-V', '13', '10.0', '1.7'),
('14', '118-V', '467', '10.0', '1.15'),
('14', '162-V', '228', '10.0', '1.15'),
('14', '195-1', '478', '10.0', '0.55'),
('14', '201-V', '390', '10.0', '2.0'),
('14', '209-V', '68', '10.0', '1.7'),
('14', '255-1', '50', '10.0', '0.35'),
('14', '257-V', '164', '10.0', '1.45'),
('14', '263-V', '54', '10.0', '1.7'),
('14', '264-V', '351', '10.0', '1.45'),
('14', '273-2', '398', '10.0', '0.55'),
('14', '281-2', '102', '10.0', '0.55'),
('14', '286-V', '87', '10.0', '1.7'),
('14', '300-V', '71', '10.0', '1.15'),
('14', '327-1', '147', '10.0', '0.45'),
('14', '335-V', '438', '10.0', '1.7'),
('14', '362-V', '311', '10.0', '1.45'),
('14', '365-V', '157', '10.0', '0.3'),
('14', '393-V', '56', '10.0', '1.45'),
('14', '397-V', '363', '10.0', '2.55'),
('14', '400-2', '380', '10.0', '0.55'),
('14', '408-V', '316', '10.0', '1.7'),
('14', '471-2', '35', '10.0', '0.55'),
('14', '498-1', '123', '10.0', '0.35'),
('19', 'ACMO', '82', '14.0', '2.1'),
('19', 'ACON', '175', '14.0', '1.8'),
('19', 'ALSC', '425', '14.0', '1.2'),
('19', 'CAMP', '87', '14.0', '1.8'),
('19', 'CENT', '80', '14.0', '1.2'),
('19', 'CHRY', '164', '14.0', '1.5'),
('19', 'CYNO', '56', '14.0', '1.5'),
('19', 'DELP', '212', '14.0', '1.8'),
('19', 'DIAN', '438', '14.0', '1.8'),
('19', 'ERYN', '13', '14.0', '1.8'),
('19', 'EUPH', '372', '14.0', '1.5'),
('19', 'GEUM', '316', '14.0', '1.8'),
('19', 'GYPS', '363', '14.0', '2.7'),
('19', 'HELI', '467', '14.0', '1.2'),
('19', 'KNIP', '486', '14.0', '2.1'),
('19', 'LAMI', '71', '14.0', '1.2'),
('19', 'LUPI', '89', '14.0', '1.5'),
('19', 'MATR', '234', '14.0', '1.8'),
('19', 'PAEO', '78', '14.0', '2.7'),
('19', 'POTE', '67', '14.0', '1.35'),
('19', 'ROSM', '207', '14.0', '1.2'),
('20', '1', '470', '7.0', '0.65'),
('20', '66', '253', '7.0', '0.1'),
('20', '103', '36', '7.0', '1.15'),
('20', '162', '468', '7.0', '0.5'),
('20', '195', '184', '7.0', '0.1'),
('20', '209', '123', '7.0', '0.4'),
('20', '210', '434', '7.0', '0.5'),
('20', '257', '266', '7.0', '0.65'),
('20', '263', '169', '7.0', '0.05'),
('20', '281', '126', '7.0', '2.45'),
('20', '362', '383', '7.0', '0.65'),
('20', '393', '147', '7.0', '0.5'),
('20', '471', '143', '7.0', '1.0'),
('20', '498', '314', '7.0', '0.5'),
('20', '6047', '361', '7.0', '0.65'),
('21', 'AZA', '103', '10.0', '8.75'),
('21', 'BRE', '364', '10.0', '2.5'),
('21', 'FOR', '108', '10.0', '2.75'),
('21', 'HUL', '408', '10.0', '11.25'),
('21', 'KOR', '117', '10.0', '2.75'),
('21', 'LIG', '210', '10.0', '0.2'),
('21', 'MAG', '195', '10.0', '7.25'),
('21', 'OLI', '471', '10.0', '5.0'),
('21', 'PEP', '397', '10.0', '7.5'),
('21', 'ROD', '1', '10.0', '9.75'),
('21', 'SER', '12', '10.0', '9.75'),
('21', 'TOV', '263', '10.0', '16.0'),
('21', 'VUU', '19', '10.0', '2.5'),
('21', 'ZUU', '242', '10.0', '1.75'),
('22', 'B-003', '393', '14.0', '5.15'),
('22', 'B-011', '286', '14.0', '12.15'),
('22', 'B-034', '281', '14.0', '6.75'),
('22', 'B-076', '39', '14.0', '2.45'),
('22', 'B-104', '28', '14.0', '22.95'),
('22', 'E-002', '335', '10.0', '2.95'),
('22', 'E-003', '365', '10.0', '0.8'),
('22', 'S-077', '471', '14.0', '5.4'),
('22', 'S-118', '103', '14.0', '9.45'),
('22', 'S-154', '364', '14.0', '2.7'),
('34', 'ACMO', '82', '14.0', '2.15'),
('34', 'ALTH', '61', '14.0', '1.25'),
('34', 'ANCE', '462', '14.0', '1.25'),
('34', 'ANEM', '390', '14.0', '2.15'),
('34', 'ANGR', '224', '14.0', '1.25'),
('34', 'ANTI', '468', '14.0', '0.5'),
('34', 'AQUI', '153', '14.0', '1.55'),
('34', 'ARDR', '105', '14.0', '1.25'),
('34', 'BEGO', '123', '14.0', '0.4'),
('34', 'CAMP', '87', '14.0', '1.85'),
('34', 'CHEI', '74', '14.0', '1.1'),
('34', 'CHMA', '164', '14.0', '1.55'),
('34', 'CORT', '300', '14.0', '5.9'),
('34', 'CYNO', '398', '14.0', '0.6'),
('34', 'DELP', '212', '14.0', '1.85'),
('34', 'ECHI', '24', '14.0', '1.85'),
('34', 'ERYN', '13', '14.0', '1.85'),
('34', 'HEDE', '427', '14.0', '4.65'),
('34', 'LUPI', '89', '14.0', '1.55'),
('34', 'OCBA', '120', '14.0', '1.25'),
('34', 'PAPA', '285', '14.0', '3.1'),
('34', 'PARH', '380', '14.0', '0.6'),
('34', 'PHLO', '143', '14.0', '0.95'),
('34', 'PRIM', '455', '14.0', '1.25'),
('34', 'RUSC', '319', '14.0', '1.25'),
('34', 'SALV', '391', '14.0', '1.25'),
('34', 'TAGE', '50', '14.0', '0.35'),
('34', 'TULKI', '469', '14.0', '0.25'),
('34', 'VIOL', '157', '14.0', '0.3'),
('34', 'VITI', '31', '14.0', '6.2'),
('34', 'WIST', '253', '14.0', '0.05'),
('35', 'ST1P1', '89', '10.0', '1.65'),
('35', 'ST1P3', '311', '10.0', '1.65'),
('35', 'ST1P4', '130', '10.0', '1.3'),
('35', 'ST1P6', '61', '10.0', '1.3'),
('35', 'ST1P8', '428', '10.0', '2.95'),
('35', 'ST1P9', '285', '10.0', '3.3'),
('35', 'ST2P1', '467', '10.0', '1.3'),
('35', 'ST2P2', '54', '10.0', '2.0'),
('35', 'ST2P3', '82', '10.0', '2.3'),
('35', 'ST2P5', '205', '10.0', '2.95'),
('35', 'ST2P6', '68', '10.0', '2.0'),
('35', 'ST3P1', '180', '10.0', '4.3'),
('35', 'ST3P2', '427', '10.0', '4.95'),
('35', 'ST3P5', '296', '10.0', '1.3'),
('35', 'ST4P1', '320', '10.0', '7.9'),
('35', 'ST4P2', '283', '10.0', '3.3'),
('35', 'ST4P5', '190', '10.0', '0.85'),
('35', 'ST4P6', '42', '10.0', '3.3');




INSERT INTO plant (PLANTCODE, PLANTNAAM, SOORT, KLEUR, HOOGTE, BLOEITIJD_START, BLOEITIJD_EINDE, PRIJS) VALUES
('1', 'RODODENDRON', 'HEESTER', 'ROOD', '125.0', '5.0', '7.0', '19.5'),
('12', 'SERING', 'HEESTER', 'PAARS', '500.0', '5.0', '6.0', '19.5'),
('13', 'KRUISDISTEL', 'VAST', 'BLAUW', '75.0', '6.0', '7.0', '3.0'),
('19', 'VUURDOORN', 'HEESTER', 'WIT', NULL, '6.0', '6.0', '5.0'),
('23', 'KLOKJESBLOEM', '2-JARIG', 'BLAUW', '70.0', '6.0', '8.0', '1.8'),
('24', 'KOGELDISTEL', 'VAST', 'BLAUW', '175.0', '6.0', '7.0', '3.0'),
('27', 'PAARDEKASTANJE', 'BOOM', 'WIT', '2500.0', '5.0', '5.0', '17.5'),
('28', 'LINDE', 'BOOM', 'GEEL', '4000.0', '7.0', '8.0', '42.5'),
('31', 'WIJNSTOK', 'KLIM', NULL, '600.0', NULL, NULL, '10.0'),
('35', 'VIOLIER', '2-JARIG', 'GEMENGD', '60.0', '6.0', '7.0', '1.0'),
('36', 'ZONNEBLOEM', '1-JARIG', 'GEEL', '150.0', '8.0', '10.0', '1.8'),
('39', 'POPULIER', 'BOOM', 'WIT', '1000.0', '3.0', '4.0', '4.5'),
('42', 'CYPERGRAS', 'WATER', NULL, '100.0', NULL, NULL, '5.0'),
('47', 'ZILVERSPAR', 'BOOM', NULL, '3000.0', NULL, NULL, '19.5'),
('50', 'AFRIKAANTJE', '1-JARIG', 'GEEL', '25.0', '7.0', '10.0', '0.6'),
('54', 'BOTERBLOEM', 'VAST', 'WIT', '50.0', '5.0', '6.0', '3.0'),
('56', 'HONDSTONG', 'VAST', 'BLAUW', '30.0', '6.0', '8.0', '2.5'),
('61', 'STOKROOS', 'VAST', 'ROOD', '250.0', '6.0', '9.0', '2.0'),
('66', 'DWERGCYPRES', 'BOOM', NULL, '500.0', NULL, NULL, '13.0'),
('67', 'GANZERIK', 'VAST', 'ROOD', '25.0', '6.0', '9.0', '2.25'),
('68', 'DAGLELIE', 'VAST', 'ROOD', '80.0', '6.0', '8.0', '3.0'),
('71', 'DOVENETEL', 'VAST', 'GEEL', '25.0', '4.0', '5.0', '2.0'),
('74', 'MUURBLOEM', '2-JARIG', 'BRUIN', '50.0', '4.0', '5.0', '1.8'),
('78', 'PIOEN', 'VAST', 'ROOD', '50.0', '6.0', '7.0', '4.5'),
('80', 'KORENBLOEM', 'VAST', 'BLAUW', '80.0', '7.0', '8.0', '2.0'),
('82', 'BEREKLAUW', 'VAST', 'WIT', '100.0', '7.0', '9.0', '3.5'),
('87', 'KLOKJESBLOEM', 'VAST', 'BLAUW', '90.0', '6.0', '8.0', '3.0'),
('89', 'LUPINE', 'VAST', 'GEMENGD', '100.0', '6.0', '7.0', '2.5'),
('95', 'VIOLIER', '1-JARIG', 'GEMENGD', '60.0', '6.0', '8.0', '1.0'),
('102', 'JUDASPENNING', '2-JARIG', 'LILA', '70.0', '5.0', '7.0', '1.0'),
('103', 'AZALEA', 'HEESTER', 'ORANJE', '200.0', '4.0', '5.0', '17.5'),
('104', 'ESDOORN', 'BOOM', 'GROEN', '2500.0', '6.0', '6.0', '17.5'),
('105', 'DRAGON', 'KRUID', 'WIT', '100.0', '8.0', '9.0', '2.0'),
('108', 'FORSYTHIA', 'HEESTER', 'GEEL', '250.0', '3.0', '4.0', '5.5'),
('117', 'KORNOELJE', 'HEESTER', 'GEEL', '300.0', '5.0', NULL, '5.5'),
('120', 'BASILICUM', 'KRUID', 'WIT', '50.0', '8.0', '9.0', '2.0'),
('123', 'BEGONIA', '1-JARIG', 'ROOD', '15.0', '6.0', '9.0', '0.65'),
('126', 'SIERUI', 'BOL', 'BLAUW', '75.0', '6.0', '8.0', '3.75'),
('130', 'VINGERHOEDSKRUID', 'VAST', 'GEMENGD', NULL, '6.0', '8.0', '2.0'),
('143', 'VLAMBLOEM', '1-JARIG', 'GEMENGD', '30.0', '7.0', '8.0', '1.5'),
('147', 'ASTER', '1-JARIG', 'GEMENGD', '50.0', '7.0', '10.0', '0.75'),
('153', 'AKELEI', 'VAST', 'BLAUW', '60.0', '5.0', '7.0', '2.5'),
('157', 'VIOOLTJE', '2-JARIG', 'GEMENGD', '15.0', '3.0', '8.0', '0.5'),
('162', 'AZIJNBOOM', 'BOOM', 'ROOD', NULL, '6.0', '7.0', '9.5'),
('164', 'MARGRIET', 'VAST', 'WIT', '70.0', '6.0', '8.0', '2.5'),
('169', 'KROKUS', 'BOL', 'WIT', '15.0', '2.0', '3.0', '0.1'),
('175', 'MONNIKSKAP', 'VAST', 'VIOLET', '120.0', '8.0', '9.0', '3.0'),
('178', 'LIJSTERBES', 'BOOM', 'WIT', '500.0', '5.0', '5.0', '7.5'),
('180', 'BOSRANK', 'KLIM', 'PAARS', '300.0', '7.0', '9.0', '6.5'),
('184', 'IRIS', 'BOL', 'BLAUW', '100.0', '5.0', '7.0', '0.14'),
('190', 'KIKKERBEET', 'WATER', 'WIT', NULL, '7.0', '8.0', '1.25'),
('195', 'MAGNOLIA', 'HEESTER', 'WIT', '1000.0', '4.0', '5.0', '14.5'),
('200', 'ACACIA', 'BOOM', 'WIT', '2500.0', '6.0', '6.0', '17.5'),
('205', 'DOTTERBLOEM', 'WATER', 'GEEL', '30.0', '4.0', '6.0', '4.5'),
('207', 'ROZEMARIJN', 'KRUID', 'BLAUW', '150.0', '5.0', '5.0', '2.0'),
('209', 'MEIDOORN', 'BOOM', 'ROZE', '700.0', '5.0', '5.0', '19.5'),
('210', 'LIGUSTER', 'HEESTER', 'WIT', '200.0', '7.0', '7.0', '0.4'),
('212', 'RIDDERSPOOR', 'VAST', 'LILA', '150.0', '6.0', '7.0', '3.0'),
('224', 'DILLE', 'KRUID', 'GEEL', '90.0', '7.0', '8.0', '2.0'),
('228', 'ENGELS GRAS', 'VAST', 'ROOD', '20.0', NULL, NULL, '2.0'),
('234', 'KAMILLE', 'VAST', 'WIT', '70.0', '6.0', '7.0', '3.0'),
('242', 'ZUURBES', 'HEESTER', 'ORANJE', '300.0', '5.0', '6.0', '3.5'),
('253', 'BLAUW DRUIFJE', 'BOL', 'BLAUW', '20.0', '2.0', '6.0', '0.12'),
('255', 'WINTERHEIDE', 'HEIDE', 'WIT', '20.0', '2.0', '4.0', '2.0'),
('257', 'BERK', 'BOOM', NULL, '2000.0', NULL, NULL, '7.5'),
('262', 'PASSIEBLOEM', 'KLIM', 'BLAUW', NULL, '6.0', '9.0', '9.5'),
('263', 'TOVERHAZELAAR', 'HEESTER', 'GEEL', '500.0', '1.0', '2.0', '32.0'),
('266', 'KORENBLOEM', '1-JARIG', 'GEMENGD', '80.0', '7.0', '8.0', '1.0'),
('281', 'BEUK', 'BOOM', 'GROEN', '3000.0', '4.0', '5.0', '12.5'),
('283', 'WATERHYACINT', 'WATER', 'BLAUW', NULL, '6.0', '9.0', '5.0'),
('285', 'KLAPROOS', 'VAST', 'ROOD', '70.0', '5.0', '6.0', '3.0'),
('286', 'TULPENBOOM', 'BOOM', 'GEEL', '2000.0', '6.0', '7.0', '22.5'),
('296', 'PETERSELIE', 'KRUID', NULL, '25.0', NULL, NULL, '2.0'),
('297', 'MAJORAAN', 'KRUID', 'PAARS', '30.0', '7.0', '8.0', '2.0'),
('300', 'PAMPUSGRAS', 'VAST', 'WIT', '300.0', '9.0', '10.0', '9.5'),
('311', 'LEVERKRUID', 'VAST', 'PAARS', '175.0', '8.0', '9.0', '2.5'),
('312', 'LISDODDE', 'WATER', 'GEEL', '200.0', '8.0', '9.0', '4.5'),
('314', 'CHRYSANT', '1-JARIG', 'GEEL', '80.0', '6.0', '8.0', '0.8'),
('316', 'NAGELKRUID', 'VAST', 'ORANJE', '50.0', '7.0', '8.0', '3.0'),
('319', 'ZURING', 'KRUID', 'ROOD', '70.0', '6.0', '8.0', '2.0'),
('320', 'WATERLELIE', 'WATER', 'WIT', NULL, NULL, NULL, '12.0'),
('327', 'STRUIKHEIDE', 'HEIDE', 'GEMENGD', '30.0', '6.0', '8.0', '2.0'),
('332', 'BLAASJESKRUID', 'WATER', 'GEEL', NULL, '7.0', '8.0', '2.5'),
('335', 'BOOMHEIDE', 'HEIDE', 'ROZE', '150.0', '7.0', '9.0', '5.5'),
('351', 'TIJM', 'KRUID', 'PAARS', '10.0', '6.0', '6.0', '2.5'),
('361', 'RIDDERSPOOR', '1-JARIG', 'GEMENGD', '50.0', '7.0', '8.0', '1.0'),
('362', 'SPAR', 'BOOM', NULL, '3000.0', NULL, NULL, '12.5'),
('363', 'GIPSKRUID', 'VAST', 'WIT', '90.0', '7.0', '8.0', '4.5'),
('364', 'BREM', 'HEESTER', 'GEEL', '150.0', '4.0', '7.0', '5.0'),
('365', 'DOPHEIDE', 'HEIDE', 'ROOD', '35.0', '6.0', '9.0', '1.5'),
('372', 'WOLFSMELK', 'VAST', 'GEEL', '60.0', '4.0', '4.0', '2.5'),
('380', 'KLAPROOS', '2-JARIG', 'GEMENGD', '40.0', '6.0', '6.0', '1.0'),
('383', 'DAHLIA', '1-JARIG', 'GEMENGD', '40.0', '8.0', '10.0', '1.0'),
('384', 'VUURWERKPLANT', 'VAST', 'ROZE', '150.0', '6.0', '7.0', '3.5'),
('390', 'ANEMOON', 'VAST', 'ROZE', '50.0', '8.0', '10.0', '3.5'),
('391', 'SALIE', 'KRUID', 'VIOLET', '100.0', '6.0', '7.0', '2.0'),
('393', 'JUDASBOOM', 'BOOM', 'ROZE', '800.0', '5.0', '5.0', '9.5'),
('397', 'PEPERBOOMPJE', 'HEESTER', 'ROZE', '125.0', '2.0', '3.0', '15.0'),
('398', 'HONDSTONG', '2-JARIG', 'BLAUW', '30.0', '5.0', '6.0', '1.0'),
('408', 'HULST', 'HEESTER', NULL, '700.0', NULL, NULL, '22.5'),
('420', 'GOUDEN REGEN', 'BOOM', 'GEEL', '600.0', '5.0', '5.0', '22.0'),
('422', 'WOLGRAS', 'WATER', 'WIT', '30.0', '5.0', '6.0', '3.5'),
('425', 'BIESLOOK', 'KRUID', 'PAARS', '20.0', '7.0', '8.0', '2.0'),
('426', 'ALYSSUM', '1-JARIG', 'PAARS', '10.0', '6.0', '9.0', '0.6'),
('427', 'KLIMOP', 'KLIM', NULL, NULL, NULL, NULL, '7.5'),
('428', 'KALMOES', 'WATER', NULL, '90.0', NULL, NULL, '4.5'),
('434', 'PETUNIA', '1-JARIG', 'ROZE', '25.0', '7.0', '10.0', '0.8'),
('437', 'MUNT', 'KRUID', 'PAARS', '40.0', '8.0', '8.0', '2.0'),
('438', 'ANJER', 'VAST', 'WIT', '40.0', '6.0', '8.0', '3.0'),
('455', 'SLEUTELBLOEM', '2-JARIG', 'GEMENGD', '25.0', '4.0', '5.0', '2.0'),
('462', 'KERVEL', 'KRUID', 'WIT', '30.0', NULL, NULL, '2.0'),
('467', 'ZONNEBLOEM', 'VAST', 'GEEL', '150.0', '8.0', '9.0', '2.0'),
('468', 'LEEUWEBEKJE', '1-JARIG', 'GEMENGD', '50.0', '7.0', '8.0', '0.8'),
('469', 'TULP', 'BOL', 'GEEL', '30.0', '4.0', '6.0', '0.4'),
('470', 'GIPSKRUID', '1-JARIG', 'WIT', '50.0', '6.0', '7.0', '1.0'),
('471', 'OLIJFWILG', 'HEESTER', 'GEEL', '400.0', '9.0', '10.0', '10.0'),
('478', 'KLAPROOS', '1-JARIG', 'GEMENGD', '35.0', '6.0', '9.0', '1.0'),
('486', 'VUURPIJL', 'VAST', 'ROOD', '120.0', '6.0', '9.0', '3.5'),
('498', 'JENEVERBES', 'BOOM', NULL, '250.0', NULL, NULL, '6.5');


INSERT INTO plantschema (CATEGORIE, MINIMUMHOOGTE, MAXIMUMHOOGTE, AFSTAND) VALUES
('LAAG', '5.0', '15.0', '20.0'),
('MIDDEL', '16.0', '60.0', '30.0'),
('ACHTER-LAAG', '61.0', '100.0', '45.0'),
('ACHTER-HOOG', '101.0', '150.0', '60.0'),
('SCHEIDING', '151.0', '300.0', '85.0'),
('BOMEN', '301.0', '4000.0', '400.0');
