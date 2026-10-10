/*
   =====================================================================================
   PROYECTO: Metro CDMX
   ARCHIVO:  02_Poblamiento_Metro.sql
   AUTOR:    Data managers 
   FECHA:    Diciembre 2025
   =====================================================================================
*/

/*
   -----------------------------------------------------------------------------------
   BLOQUE 1: CARGA DE DATOS (INFRAESTRUCTURA)
   -----------------------------------------------------------------------------------
*/

-- =====================================================================================
-- 1. INFRAESTRUCTURA (Líneas, Estaciones, Servicios)
-- =====================================================================================

-- 1.1 Líneas del Sistema
INSERT INTO Linea (NumeroLinea, Nombre) VALUES
(1, 'Línea 1 (Rosa)'), (2, 'Línea 2 (Azul)'), (3, 'Línea 3 (Verde Olivo)'),
(4, 'Línea 4 (Cian)'), (5, 'Línea 5 (Amarilla)'), (6, 'Línea 6 (Roja)'),
(7, 'Línea 7 (Naranja)'), (8, 'Línea 8 (Verde)'), (9, 'Línea 9 (Café)'),
(12, 'Línea 12 (Dorada)'), (10, 'Línea A (Férrea)'), (11, 'Línea B (Gris/Verde)')
ON CONFLICT DO NOTHING;

-- 1.2 Servicios de Interconexión
INSERT INTO Servicio (IDServicio, Nombre, Tipo) VALUES
(1, 'Metrobús L1', 'Metrobús'), (2, 'Metrobús L3', 'Metrobús'), 
(3, 'Trolebús Eje Central', 'Trolebús'), (4, 'RTP Circuito', 'RTP')
ON CONFLICT DO NOTHING;



-- 1.3 Estaciones 
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
-- LÍNEA 1
(101, 'Mto. Alberto Barajas Celis', 'Pantitlán', '05:00:00', '00:00:00', '5512345678'),
(102, 'Lic. Pugberto', 'Zaragoza', '05:00:00', '00:00:00', '5512345679'),
(103, 'Aguilar López Paola Guadalupe', 'Gomez Farias', '05:00:00', '00:00:00', '5667934710'),
(104, 'Núñez Martínez Brenda Carolina', 'Blvd. Puerto Aéreo', '05:00:00', '00:00:00', '5667934711'),
(105, 'Valdez Torres Daniela Michelle', 'Balbuena', '05:00:00', '00:00:00', '5667934713'), 
(106, 'Flores Reyes Camila Renata', 'Moctezuma', '05:00:00', '00:00:00', '5667934714'),
(107, 'Hernández Hernández Diana Laura', 'San Lázaro', '05:00:00', '00:00:00', '5667934715'),
(108, 'Martínez Flores Jesús Eduardo', 'Candelaria', '05:00:00', '00:00:00', '5667934718'),
(109, 'López Moreno Paola Guadalupe', 'Merced', '05:00:00', '00:00:00', '5667934719'),
(110, 'González Campos Alejandro David', 'Pino Suarez', '05:00:00', '00:00:00', '5667934720'),
(111, 'Tony Stark', 'Isabel la Catolica', '05:00:00', '00:00:00', '5511111114'),
(112, 'Natasha Romanoff', 'Salto del Agua', '05:00:00', '00:00:00', '5511111115'), 
(113, 'Steve Rogers', 'Balderas', '05:00:00', '00:00:00', '5511111116'),
(114, 'Wanda Maximoff', 'Cuauhtemoc', '05:00:00', '00:00:00', '5511111117'),
(115, 'Pérez Castañeda Verónica Lizeth', 'Insurgentes', '05:00:00', '00:00:00', '5667934721'),
(116, 'Rodríguez Chávez Eduardo Alejandro', 'Sevilla', '05:00:00', '00:00:00', '5667934722'),
(117, 'Vision', 'Chapultepec', '05:00:00', '00:00:00', '5511111118'),
(118, 'Sánchez Mejía Fabiola Denisse', 'Juanacatlán', '05:00:00', '00:00:00', '5667934723'),
(119, 'Sheldon Cooper', 'Tacubaya', '05:00:00', '00:00:00', '5511223344'),
(120, 'Nick Fury', 'Observatorio', '05:00:00', '00:00:00', '5511111119'),

-- LÍNEA 2 
(201, 'Luke Skywalker', 'Cuatro Caminos', '05:00:00', '00:00:00', '5544332211'),
(202, 'Anakin Skywalker', 'Panteones', '05:00:00', '00:00:00', '5522222222'),
(203, 'Obi-Wan Kenobi', 'Tacuba', '05:00:00', '00:00:00', '5522222223'),
(204, 'Soraya Montenegro', 'Cuitláhuac', '05:00:00', '00:00:00', '5522222224'), 
(205, 'Catalina Creel', 'Popotla', '05:00:00', '00:00:00', '5522222225'), 
(206, 'Teresa Chávez', 'Colegio Militar', '05:00:00', '00:00:00', '5522222226'), 
(207, 'Rubí Pérez', 'Normal', '05:00:00', '00:00:00', '5522222227'), 
(208, 'Ramírez Huerta Adrián Alejandro', 'San Cosme', '05:00:00', '00:00:00', '5667934724'),
(209, 'Cruz Luna Natalia Andrea', 'Revolucion', '05:00:00', '00:00:00', '5667934726'),
(210, 'Flores López Miguel Ángel', 'Hidalgo', '05:00:00', '00:00:00', '5667934725'),
(211, 'Gómez Martínez Andrea Paola', 'Bellas Artes', '05:00:00', '00:00:00', '5667934727'), 
(212, 'Vargas Torres Óscar Emmanuel', 'Allende', '05:00:00', '00:00:00', '5667934735'), 
(213, 'Frida Kahlo', 'Zócalo', '05:00:00', '00:00:00', '5500112233'),
(215, 'Reyes Vega Rubén Darío', 'San Antonio Abad', '05:00:00', '00:00:00', '5667934729'), 
(216, 'Torres Ríos Alejandra Itzel', 'Chabacano', '05:00:00', '00:00:00', '5667934730'), 
(217, 'Domínguez Soto Pablo Esteban', 'Viaducto', '05:00:00', '00:00:00', '5667934732'), 
(218, 'Ramos Campos Juan Carlos', 'Xola', '05:00:00', '00:00:00', '5667934731'), 
(220, 'Ortega Fuentes Carlos Alberto', 'Nativitas', '05:00:00', '00:00:00', '5667934734'),
(221, 'Navarro Ramírez Jorge Luis', 'Portales', '05:00:00', '00:00:00', '5667934737'),
(222, 'Guerrero Hernández Fernando Javier', 'Ermita', '05:00:00', '00:00:00', '5667934739'), 
(223, 'Mendoza Flores Ricardo Iván', 'General Anaya', '05:00:00', '00:00:00', '5667934736'), 
(224, 'Jorge Negrete', 'Tasqueña', '05:00:00', '00:00:00', '5566778899'),

-- LÍNEA 3 
(301, 'Gerardo Avilés Rosas', 'Indios Verdes', '05:00:00', '00:00:00', '5599887711'), 
(302, 'Tanjiro Kamado', 'Deportivo 18 de Marzo', '05:00:00', '00:00:00', '5533333332'),
(303, 'Nezuko Kamado', 'Potrero', '05:00:00', '00:00:00', '5533333333'),
(304, 'Kyojuro Rengoku', 'La Raza', '05:00:00', '00:00:00', '5533333334'),
(305, 'Goku Son', 'Tlatelolco', '05:00:00', '00:00:00', '5533333335'),
(306, 'Vegeta Prince', 'Guerrero', '05:00:00', '00:00:00', '5533333336'),
(308, 'Silva Moreno Hugo Adrián', 'Juarez', '05:00:00', '00:00:00', '5667934738'), 
(309, 'Rojas Campos Raúl Ernesto', 'Balderas', '05:00:00', '00:00:00', '5667934740'),
(310, 'Cortés Chávez Manuel Jesús', 'Niños Heroes', '05:00:00', '00:00:00', '5667934741'),
(311, 'Aguilar Mejía Gerardo Iván', 'Hospital General', '05:00:00', '00:00:00', '5667934742'),
(312, 'Núñez Huerta Julián Eduardo', 'Centro Médico', '05:00:00', '00:00:00', '5667934743'),
(313, 'Valdez Luna Álvaro Ignacio', 'Etiopia', '05:00:00', '00:00:00', '5667934744'),
(314, 'García López José Antonio', 'Eugenia', '05:00:00', '00:00:00', '5667934745'),
(315, 'Hernández Martínez Jorge Luis', 'Division del Norte', '05:00:00', '00:00:00', '5667934746'), 
(316, 'Martínez Torres Francisco Javier', 'Zapata', '05:00:00', '00:00:00', '5667934747'),
(317, 'López Reyes Iván Mauricio', 'Coyoacan', '05:00:00', '00:00:00', '5667934748'),
(318, 'González Vega Roberto Carlos', 'Viveros', '05:00:00', '00:00:00', '5667934749'),
(319, 'Pérez Ríos Adrián Alejandro', 'M.A. Quevedo', '05:00:00', '00:00:00', '5667934750'),
(320, 'Rodríguez Soto Héctor Manuel', 'Copilco', '05:00:00', '00:00:00', '5533333336'),
(321, 'Octavio Paz', 'Universidad', '05:00:00', '00:00:00', '5577665544'),

-- LINEA 4
(401, 'Sánchez Campos Julián Eduardo', 'Martín Carrera', '05:00:00', '00:00:00', '5667934752'),
(402, 'Ramírez Paredes Pablo Esteban',  'Talismán', '05:00:00', '00:00:00', '5667934751'),
(403, 'Cruz Fuentes Juan Carlos',  'Bondojito', '05:00:00', '00:00:00', '5667934753'),
(404, 'Flores Ramírez Jesús Eduardo',  'Consulado', '05:00:00', '00:00:00', '5667934754'),
(405, 'Gómez Hernández Fernando Javier', 'Canal del Norte', '05:00:00', '00:00:00', '5667934755'),
(406, 'Vargas Flores Ricardo Iván',  'Candelaria', '05:00:00', '00:00:00', '5667934756'),
(407, 'Morales Moreno Verónica Lizeth',  'Morelos', '05:00:00', '00:00:00', '5667934757'),
(408, 'Reyes Campos Eduardo Alejandro',  'Fray Servando', '05:00:00', '00:00:00', '5667934758'),
(409, 'Torres Castañeda Francisco Javier',  'Jamaica', '05:00:00', '00:00:00', '5667934759'),
(410, 'Domínguez Chávez Raúl Ernesto',  'Santa Anita', '05:00:00', '00:00:00', '5667934760'),

-- LINEA 5
(501, 'Ramos Mejía Gerardo Iván', 'Pantitlán', '05:00:00', '00:00:00', '5667934761'),
(502, 'Castillo Huerta Manuel Jesús', 'Hangares', '05:00:00', '00:00:00', '5667934762'),
(503, 'Ortega Luna Rubén Darío', 'Terminal Aerea', '05:00:00', '00:00:00', '5667934763'),
(504, 'Navarro López Ana Sofía', 'Oceanía', '05:00:00', '00:00:00', '5667934765'),
(505, 'Guerrero Martínez Patricia Elena', 'Aragón', '05:00:00', '00:00:00', '5667934764'),
(506, 'Juan juartinez', 'Eduardo Molina', '05:00:00', '00:00:00', '5667934766'),
(507, 'Hernandez Publo', 'Consulado', '05:00:00', '00:00:00', '5667934767'),
(508, 'Hernandez Pablo', 'Valle Gómez', '05:00:00', '00:00:00', '5667934768'),
(509, 'Peres Publo', 'Misterios', '05:00:00', '00:00:00', '5667934769'),
(510, 'Perez Publo', 'La Raza', '05:00:00', '00:00:00', '5667934770'),
(511, 'Perez Pablo', 'Autobuses del Norte', '05:00:00', '00:00:00', '5667934771'),
(512, 'Peres Pablo', 'Instituto del Petroleo', '05:00:00', '00:00:00', '5667934772'),
(513, 'Cortés Luna Verónica Lizeth', 'Politécnico', '05:00:00', '00:00:00', '5667934773'),

-- LINEA 6
(601, 'Delgado Huerta Adrián Alejandro', 'El Rosario', '05:00:00', '00:00:00', '5667934774'),
(602, 'Rojas Mejía Rubén Darío', 'Tezozómoc', '05:00:00', '00:00:00', '5667934775'),
(603, 'Silva Chávez Manuel Jesús', 'UAM-Azcapotzalco', '05:00:00', '00:00:00', ''),
(604, 'Mendoza Castañeda Sergio Alberto', 'Ferrería', '05:00:00', '00:00:00', '5667934709'),
(605, 'Guerrero Campos Raúl Ernesto', 'Norte 45', '05:00:00', '00:00:00', '5667934708'),
(606, 'Navarro Moreno Francisco Javier', 'Vallejo', '05:00:00', '00:00:00', '5667934707'),
(607, 'Ortega Flores Eduardo Alejandro', 'Instituto del petroleo', '05:00:00', '00:00:00', '5667934706'),
(608, 'Castillo Hernández Óscar Emmanuel', 'Lindavista', '05:00:00', '00:00:00', '5667934705'),
(609, 'Ramos Ramírez Alejandro David', 'Deportivo 18 de Marzo', '05:00:00', '00:00:00', '5667934704'),
(610, 'Domínguez Fuentes Mónica Alejandra', 'La Villa', '05:00:00', '00:00:00', '5667934703'),
(611, 'Torres Paredes Natalia Andrea', 'Martín Carrera', '05:00:00', '00:00:00', '5667934702'),

-- LÍNEA 7 
(701, 'Monkey D. Luffy', 'El Rosario', '05:00:00', '00:00:00', '5511122233'),
(702, 'Roronoa Zoro', 'Aquiles Serdán', '05:00:00', '00:00:00', '5577777772'),
(703, 'Frodo Baggins', 'Camarones', '05:00:00', '00:00:00', '5577777773'),
(704, 'Gandalf El Gris', 'Refinería', '05:00:00', '00:00:00', '5577777774'),
(705, 'Reyes Campos Alejandra Itzel', 'Tacuba', '05:00:00', '00:00:00', '5667934701'),
(706, 'Morales Soto Gabriela Monserrat', 'San Joaquin', '05:00:00', '00:00:00', '5667934700'),
(707, 'Vargas Ríos Lucía Berenice', 'Polanco', '05:00:00', '00:00:00', '5667934699'),
(708, 'Gómez Vega Regina Valentina', 'Auditario', '05:00:00', '00:00:00', '5667934698'),
(709, 'Cruz Luna Rubén Darío', 'Constituyentes', '05:00:00', '00:00:00', '5667934697'),
(710, 'Ramírez Huerta Sergio Alberto', 'Tacubaya', '05:00:00', '00:00:00', '5667934696'),
(711, 'Legolas Greenleaf', 'San Pedro de los Pinos', '05:00:00', '00:00:00', '5577777776'),
(712, 'Gimli Son of Gloin', 'San Antonio', '05:00:00', '00:00:00', '5577777777'),
(713, 'Sánchez Mejía Raúl Ernesto', 'Mixcoac', '05:00:00', '00:00:00', '5667934695'), 
(714, 'Huitzil Sánchez Martínez', 'Barranca del Muerto', '05:00:00', '00:00:00', '5533344455'),

-- LINEA 8
(801, 'Rodríguez Chávez Francisco Javier', 'Garibaldi', '05:00:00', '00:00:00', '5667934694'),
(802, 'Pérez Castañeda Fernando Javier', 'Bellas Artes', '05:00:00', '00:00:00', '5667934693'),
(803, 'González Campos Ricardo Iván', 'San Juan de Letrán', '05:00:00', '00:00:00', '5667934692'),
(804, 'López Moreno Andrea Paola', 'Salto del Agua', '05:00:00', '00:00:00', '5667934691'),
(805, 'Martínez Flores Jorge Luis', 'Doctores', '05:00:00', '00:00:00', '5667934690'),
(806, 'Hernández Hernández José Antonio', 'Obrera', '05:00:00', '00:00:00', '5667934689'),
(807, 'García Ramírez Miguel Ángel', 'Chabacano', '05:00:00', '00:00:00', '5667934688'),
(808, 'Valdez Fuentes Natalia Andrea', 'La Viga', '05:00:00', '00:00:00', '5667934687'),
(809, 'Núñez Paredes Adrián Alejandro', 'Santa Anita', '05:00:00', '00:00:00', '5667934686'),
(810, 'Aguilar Campos Fabiola Denisse', 'Coyuya', '05:00:00', '00:00:00', '5667934685'),
(811, 'Cortés Soto Eduardo Alejandro', 'Iztacalco', '05:00:00', '00:00:00', '5667934684'),
(812, 'Delgado Ríos Verónica Lizeth', 'Apatlaco', '05:00:00', '00:00:00', '5667934683'),
(813, 'Rojas Vega Alejandro David', 'Aculco', '05:00:00', '00:00:00', '5667934682'),
(814, 'Silva Reyes Paola Guadalupe', 'Escuadron 201', '05:00:00', '00:00:00', '5667934681'),
(815, 'Mendoza Torres Jesús Eduardo', 'Atlalilco', '05:00:00', '00:00:00', '5667934680'),
(816, 'Guerrero Martínez Diana Laura', 'Iztapalapa', '05:00:00', '00:00:00', '5667934679'),
(817, 'Navarro López Juan Carlos', 'Cerro de la Estrella', '05:00:00', '00:00:00', '5667934678'),
(818, 'Ortega Luna Lucía Berenice', 'UAM-I', '05:00:00', '00:00:00', '5667934677'),
(819, 'Castillo Huerta Regina Valentin', 'Constitucion 1917', '05:00:00', '00:00:00', '5667934842'),

-- LINEA 9
(901, 'Ramos Mejía Camila Renata', 'Tacubaya', '05:00:00', '00:00:00', '5667934841'),
(902, 'Domínguez Chávez Mónica Alejandra', 'Patriotismo', '05:00:00', '00:00:00', '5667934844'),
(903, 'Torres Castañeda Daniela Michelle', 'Chilpancingo', '05:00:00', '00:00:00', '5667934872'),
(904, 'Reyes Campos Brenda Carolina', 'Centro Medico', '05:00:00', '00:00:00', '5667934871'),
(905, 'Morales Moreno Paola Guadalupe', 'Lazaro Cardenas', '05:00:00', '00:00:00', '5667934870'),
(906, 'Vargas Flores Sofía Alejandra', 'Chabacano', '05:00:00', '00:00:00', '5667934869'),
(907, 'Gómez Hernández Laura Daniela', 'Jamaica', '05:00:00', '00:00:00', '5667934868'),
(908, 'Flores Ramírez Andrea Paola', 'Mixiuhca', '05:00:00', '00:00:00', '5667934867'),
(909, 'Ramírez Paredes Sergio Alberto', 'Velodromo', '05:00:00', '00:00:00', '5667934863'),
(910, 'Sánchez Campos Raúl Ernesto', 'Ciudad Deportiva', '05:00:00', '00:00:00', '5667934861'),
(911, 'Rodríguez Soto Hugo Adrián', 'Puebla', '05:00:00', '00:00:00', '5667934864'),
(912, 'Pérez Ríos Ricardo Iván', 'Pantitlán', '05:00:00', '00:00:00', '5667934865'),

-- LÍNEA 12 
(1201, 'Ricardo Badillo Macías', 'Mixcoac', '05:00:00', '00:00:00', '5588899900'),
(1202, 'González Vega Fernando Javier', 'Insurgentes Sur', '05:00:00', '00:00:00', '5667934860'),
(1203, 'López Reyes Alejandro David', 'Hospital 20 nov', '05:00:00', '00:00:00', '5667934858'),
(1204, 'Martínez Torres Jesús Eduardo', 'Zapata', '05:00:00', '00:00:00', '5667934857'),
(1205, 'Hernández Martínez Miguel Ángel', 'Parque de los Venados', '05:00:00', '00:00:00', '5667934853'),
(1206, 'García López Luis Ángel', 'Eje Central', '05:00:00', '00:00:00', '5667934854'),
(1207, 'Valdez Luna Álvaro Ignacio', 'Ermita', '05:00:00', '00:00:00', '5667934855'),
(1208, 'Núñez Huerta Sergio Alberto', 'Mexicaltzingo', '05:00:00', '00:00:00', '5667934851'),
(1209, 'Aguilar Mejía Francisco Javier', 'Atlalilco', '05:00:00', '00:00:00', '5667934846'),
(1210, 'Cortés Chávez Eduardo Alejandro', 'Culhuacan', '05:00:00', '00:00:00', '5667934848'),
(1211, 'Delgado Castañeda Fabiola Denisse', 'San Andrés Tomatlán', '05:00:00', '00:00:00', '5667934840'),
(1212, 'Rojas Campos Mariana Jazmín', 'Lomas Estrella', '05:00:00', '00:00:00', '5667934850'),
(1213, 'Silva Moreno Sofía Alejandra', 'Calle 11', '05:00:00', '00:00:00', '5667934847'),
(1214, 'Gael García', 'Periférico Oriente', '05:00:00', '00:00:00', '5512121207'),
(1215, 'Salma Hayek', 'Tezonco', '05:00:00', '00:00:00', '5512121206'),
(1216, 'Emmanuel Lubezki', 'Olivos', '05:00:00', '00:00:00', '5512121205'),
(1217, 'Alejandro G. Iñárritu', 'Nopalera', '05:00:00', '00:00:00', '5512121204'),
(1218, 'Alfonso Cuarón', 'Zapotitlán', '05:00:00', '00:00:00', '5512121203'),
(1219, 'Diego Luna', 'Tlaltenco', '05:00:00', '00:00:00', '5512121208'),
(1220, 'Guillermo del Toro', 'Tláhuac', '05:00:00', '00:00:00', '5566677788'),

-- LINEA A
(1001, 'Mendoza Flores Jesús Eduardo', 'Pantitlán', '05:00:00', '00:00:00', '5667934843'),
(1002, 'Guerrero Hernández Laura Daniela', 'Agricola Oriental', '05:00:00', '00:00:00', '5667934845'),
(1003, 'Navarro Ramírez Miguel Ángel', 'Canal de San Juan', '05:00:00', '00:00:00', '5667934849'),
(1004, 'Ortega Fuentes Rubén Darío', 'Tepalcates', '05:00:00', '00:00:00', '5667934852'),
(1005, 'Castillo Paredes Manuel Jesús', 'Guelatao', '05:00:00', '00:00:00', '5667934856'),
(1006, 'Ramos Campos Sergio Alberto', 'Peñon Viejo', '05:00:00', '00:00:00', '5667934859'),
(1007, 'Domínguez Soto Raúl Ernesto', 'Acatitla', '05:00:00', '00:00:00', '5667934862'),
(1008, 'Torres Ríos Hugo Adrián', 'Santa Marta', '05:00:00', '00:00:00', '5667934866'),
(1009, 'Reyes Vega Ricardo Iván', 'Los Reyes', '05:00:00', '00:00:00', '5667934873'),
(1010, 'Morales Reyes Andrea Paola', 'La Paz', '05:00:00', '00:00:00', '5667934676'),

-- LINEA B
(1101, 'Gómez Martínez Patricia Elena ', 'Ciudad Azteca', '05:00:00', '00:00:00', '5667934675'), 
(1102, 'Vargas Torres Jorge Luis', 'Plaza Aragon', '05:00:00', '00:00:00', '5667934674'),
(1103, 'Flores López José Antonio', 'Olimpica', '05:00:00', '00:00:00', '5667934673'), 
(1104, 'Cruz Luna Julián Eduardo', 'Ecatepec', '05:00:00', '00:00:00', '5667934672'),
(1105, 'Ramírez Huerta Gerardo Iván', 'Muzquiz', '05:00:00', '00:00:00', '5667934667'),
(1106, 'Sánchez Mejía Pablo Esteban', 'Rio de los Remedios', '05:00:00', '00:00:00', '5667934669'),
(1107, 'Rodríguez Chávez Manuel Jesús', 'Impulsora', '05:00:00', '00:00:00', '5667934670'),
(1108, 'Pérez Castañeda Francisco Javier', 'Nezahualcóyotl', '05:00:00', '00:00:00', '5667934671'),
(1109, 'González Campos Óscar Emmanuel', 'Villa de Aragón', '05:00:00', '00:00:00', '5667934668'),
(1110, 'López Moreno Alejandro David', 'Bosque de Aragón', '05:00:00', '00:00:00', '5667934666'),
(1111, 'Martínez Flores Jesús Eduardo', 'Deportivo Oceanía', '05:00:00', '00:00:00', '5667934665'),
(1112, 'Hernández Hernández Miguel Ángel', 'Oceanía', '05:00:00', '00:00:00', '5667934664'),
(1113, 'García Ramírez Carlos Alberto', 'Romero Rubio', '05:00:00', '00:00:00', '5667934663'),
(1114, 'Valdez Fuentes Lucía Berenice', 'Ricardo Flores Magón', '05:00:00', '00:00:00', '5667934662'),
(1115, 'Núñez Paredes Regina Valentina', 'San Lázaro', '05:00:00', '00:00:00', '5667934661'),
(1116, 'Aguilar Campos Camila Renata', 'Morelos', '05:00:00', '00:00:00', '5667934660'),
(1117, 'Cortés Soto Mónica Alejandra', 'Tepito', '05:00:00', '00:00:00', '5667934659'),
(1118, 'Delgado Ríos Daniela Michelle', 'Lagunilla', '05:00:00', '00:00:00', '5667934658'),
(1119, 'Rojas Vega Brenda Carolina', 'Garibaldi', '05:00:00', '00:00:00', '5667934657'),
(1120, 'Silva Reyes Paola Guadalupe', 'Guerrero', '05:00:00', '00:00:00', '5667934656'),
(1121, 'Mendoza Torres Sofía Alejandra', 'Buenavista', '05:00:00', '00:00:00', '5667934654')

ON CONFLICT DO NOTHING;


-- 1. BALDERAS (Conflicto L1 vs L3) - Causa de tu error actual
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(309, 'Rojas Campos Raúl Ernesto', 'Balderas L3', '05:00:00', '00:00:00', '5667934740')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 2. PANTITLÁN (Conflictos con L1)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(501,  'Ramos Mejía Gerardo Iván',     'Pantitlán L5', '05:00:00', '00:00:00', '5667934761'),
(912,  'Pérez Ríos Ricardo Iván',      'Pantitlán L9', '05:00:00', '00:00:00', '5667934865'),
(1001, 'Mendoza Flores Jesús Eduardo', 'Pantitlán LA', '05:00:00', '00:00:00', '5667934843')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 3. TACUBAYA (Conflictos con L1)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(710, 'Ramírez Huerta Sergio Alberto', 'Tacubaya L7', '05:00:00', '00:00:00', '5667934696'),
(901, 'Ramos Mejía Camila Renata',     'Tacubaya L9', '05:00:00', '00:00:00', '5667934841')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 4. HIDALGO (Conflictos con L2)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(307, 'Naruto Uzumaki', 'Hidalgo L3', '05:00:00', '00:00:00', '5533333337')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 5. CHABACANO (Conflictos con L2)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(807, 'García Ramírez Miguel Ángel',   'Chabacano L8', '05:00:00', '00:00:00', '5667934688'),
(906, 'Vargas Flores Sofía Alejandra', 'Chabacano L9', '05:00:00', '00:00:00', '5667934869')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 6. PINO SUÁREZ (Conflictos con L1)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(214, 'Morales Reyes Mariana Jazmín', 'Pino Suárez L2', '05:00:00', '00:00:00', '5667934728')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 7. BELLAS ARTES Y SALTO DEL AGUA (Conflictos con L2 y L1)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(802, 'Pérez Castañeda Fernando Javier', 'Bellas Artes L8',   '05:00:00', '00:00:00', '5667934693'),
(804, 'López Moreno Andrea Paola',       'Salto del Agua L8', '05:00:00', '00:00:00', '5667934691')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 8. CONSULADO, CANDELARIA, MORELOS, JAMAICA (Conflictos L4 vs L5, L1, LB, L9)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(507,  'Hernandez Publo',                'Consulado L5',  '05:00:00', '00:00:00', '5667934767'),
(406,  'Vargas Flores Ricardo Iván',     'Candelaria L4', '05:00:00', '00:00:00', '5667934756'),
(1116, 'Aguilar Campos Camila Renata',   'Morelos LB',    '05:00:00', '00:00:00', '5667934660'),
(907,  'Gómez Hernández Laura Daniela',  'Jamaica L9',    '05:00:00', '00:00:00', '5667934868')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 9. SAN LÁZARO, OCEANÍA, GUERRERO, GARIBALDI (Conflictos con Línea B)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(1115, 'Núñez Paredes Regina Valentina', 'San Lázaro LB', '05:00:00', '00:00:00', '5667934661'),
(504,  'Navarro López Ana Sofía',        'Oceanía L5',    '05:00:00', '00:00:00', '5667934765'), 
(1112, 'Hernández Hernández Miguel Ángel', 'Oceanía LB',    '05:00:00', '00:00:00', '5667934664'),
(1120, 'Silva Reyes Paola Guadalupe',    'Guerrero LB',   '05:00:00', '00:00:00', '5667934656'),
(1119, 'Rojas Vega Brenda Carolina',     'Garibaldi LB',  '05:00:00', '00:00:00', '5667934657')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 10. LA RAZA, DEPORTIVO 18 MARZO, MARTÍN CARRERA (Conflictos L3/L5/L6)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(510, 'Perez Publo',                   'La Raza L5',            '05:00:00', '00:00:00', '5667934770'),
(609, 'Ramos Ramírez Alejandro David', 'Deportivo 18 de Marzo L6', '05:00:00', '00:00:00', '5667934704'),
(611, 'Torres Paredes Natalia Andrea', 'Martín Carrera L6',     '05:00:00', '00:00:00', '5667934702'),
(607, 'Ortega Flores Eduardo Alejandro', 'Instituto del Petróleo L6', '05:00:00', '00:00:00', '5667934706')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 11. TACUBA, EL ROSARIO (Conflictos L2/L6/L7)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(705, 'Reyes Campos Alejandra Itzel', 'Tacuba L7',     '05:00:00', '00:00:00', '5667934701'),
(701, 'Monkey D. Luffy',              'El Rosario L7', '05:00:00', '00:00:00', '5511122233')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 12. ERMITA, ZAPATA, MIXCOAC, ATLALILCO (Conflictos con L12)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(1207, 'Valdez Luna Álvaro Ignacio',     'Ermita L12',    '05:00:00', '00:00:00', '5667934855'),
(1204, 'Martínez Torres Jesús Eduardo',  'Zapata L12',    '05:00:00', '00:00:00', '5667934857'),
(1201, 'Ricardo Badillo Macías',         'Mixcoac L12',   '05:00:00', '00:00:00', '5588899900'),
(1209, 'Aguilar Mejía Francisco Javier', 'Atlalilco L12', '05:00:00', '00:00:00', '5667934846')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 13. SANTA ANITA (L4 y L8)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(809, 'Núñez Paredes Adrián Alejandro', 'Santa Anita L8', '05:00:00', '00:00:00', '5667934686')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;

-- 14. CENTRO MÉDICO (L3 vs L9)
INSERT INTO Estacion (NumeroEstacion, JefeEstacion, NombreEstacion, HoraApertura, HoraCierre, Telefono) VALUES
(904, 'Reyes Campos Brenda Carolina', 'Centro Medico L9', '05:00:00', '00:00:00', '5667934871')
ON CONFLICT (NumeroEstacion) DO UPDATE SET NombreEstacion = EXCLUDED.NombreEstacion;


-- 1.4 Red de Transporte (Relación Línea-Estación)
INSERT INTO Pertenecer (NumeroLinea, NumeroEstacion) VALUES
(1, 101), (1, 102), (1, 103), (1, 104), (1, 105), (1, 106), (1, 107), (1, 108), (1, 109), (1, 110), (1, 111), (1, 112), (1, 113), (1, 114),(1, 115), (1, 116), (1, 117), (1, 118), (1, 119), (1, 120),
(2, 201), (2, 202), (2, 203), (2, 204), (2, 205), (2, 206), (2, 207), (2, 208), (2, 209), (2, 210), (2, 211), (2, 212), (2, 213),(2, 215), (2, 216), (2, 217), (2, 218), (2, 220), (2, 221), (2, 222), (2, 223), (2, 224),
(3, 301), (3, 302), (3, 303), (3, 304), (3, 305), (3, 306),  (3, 308), (3, 309), (3, 310), (3, 311), (3, 312), (3, 313), (3, 314),(3, 315), (3, 316), (3, 317), (3, 318), (3, 319), (3, 320), (3, 321),
(4, 401), (4, 402), (4, 403), (4, 404), (4, 405), (4, 406), (4, 407), (4, 408), (4, 409), (4, 410),
(5, 501), (5, 502), (5, 503), (5, 504), (5, 505), (5, 506), (5, 507), (5, 508), (5, 509), (5, 510), (5, 511), (5, 512), (5, 513),
(6, 601), (6, 602), (6, 603), (6, 604), (6, 605), (6, 606), (6, 607), (6, 608), (6, 609), (6, 610), (6, 611),
(7, 701), (7, 702), (7, 703), (7, 704), (7, 705), (7, 706), (7, 707), (7, 708), (7, 709), (7, 710), (7, 711), (7, 712), (7, 713), (7, 714),
(8, 801), (8, 802), (8, 803), (8, 804), (8, 805), (8, 806), (8, 807), (8, 808), (8, 809), (8, 810), (8, 811), (8, 812), (8, 813), (8, 814),(8, 815), (8, 816), (8, 817), (8, 818), (8, 819),
(9, 901), (9, 902), (9, 903), (9, 904), (9, 905), (9, 906), (9, 907), (9, 908), (9, 909), (9, 910), (9, 911), (9, 912),
(10, 1001), (10, 1002), (10, 1003), (10, 1004), (10, 1005), (10, 1006), (10, 1007), (10, 1008), (10, 1009), (10, 1010),
(11, 1101), (11, 1102), (11, 1103), (11, 1104), (11, 1105), (11, 1106), (11, 1107), (11, 1108), (11, 1109), (11, 1110), (11, 1111), (11, 1112), (11, 1113), (11, 1114), (11, 1115), (11, 1116), (11, 1117), (11, 1118), (11, 1119), (11, 1120), (11, 1121),
(12, 1201), (12, 1202), (12, 1203), (12, 1204), (12, 1205), (12, 1206), (12, 1207), (12, 1208), (12, 1209), (12, 1210), (12, 1211), (12, 1212), (12, 1213), (12, 1214), (12, 1215), (12, 1216), (12, 1217), (12, 1218), (12, 1219), (12, 1220)

ON CONFLICT DO NOTHING;


-- =====================================================================================
-- Se realizan inserciones específicas para las consultas para más diversidad y dado que
-- Mockaroo no tiene tanta diversidad en sus nombres proporcionados
-- =====================================================================================

INSERT INTO Conductor (CURP, Nombre, Paterno, Materno, Sexo, Salario, Nacimiento, Estado) VALUES
('AODF810729HDFLNR01', 'Fernando', 'Alonso', 'Díaz', 'M', 15000, '1981-07-29', 'Ciudad de México'), 
('DIRS950505HPLNMR02', 'Simón', 'Dice', 'Ramírez', 'M', 8000, '1995-05-05', 'Puebla'),             
('BORL510819MVZTRL03', 'Laura', 'Bozzo', 'Rotter', 'F', 14000, '1951-08-19', 'Veracruz'),          
('AODJ850106MJCXRA04', 'Juana', 'Arco', 'Domrémy', 'F', 18000, '1985-01-06', 'Jalisco'),            
('PAMP950810HNLXRR05', 'Peter', 'Parker', 'May', 'M', 18500, '1995-08-10', 'Nuevo León'),       
('WAMB850219HDFRYN06', 'Bruce', 'Wayne', 'Martha', 'M', 25000, '1985-02-19', 'Ciudad de México'),
('PRID881103MCZRNC07', 'Diana', 'Prince', 'Zeus', 'F', 24000, '1988-11-03', 'Estado de México'),
('KEMC900722HPLRNT08', 'Clark', 'Kent', 'Martha', 'M', 15500, '1990-07-22', 'Puebla'),
('ALNB930510HQTRLL09', 'Barry', 'Allen', 'Nora', 'M', 19000, '1993-05-10', 'Querétaro'),
('JOMH820918HGTNRD10', 'Hal', 'Jordan', 'Martin', 'M', 14500, '1982-09-18', 'Guanajuato'),
('GRAJ951205HJCXRY11', 'Richard', 'Grayson', 'John', 'M', 18200, '1995-12-05', 'Jalisco'),
('TOWJ870329HMNLDD12', 'Jason', 'Todd', 'Willis', 'M', 16800, '1987-03-29', 'Michoacán'),
('JOCJ890814MVZSNS13', 'Jessica', 'Jones', 'Campbell', 'F', 17500, '1989-08-14', 'Veracruz'),
('LOHJ700401HOXGNN14', 'James', 'Logan', 'Howlett', 'M', 15200, '1970-04-01', 'Oaxaca'),
('GREL941020MCSREY15', 'Jean', 'Grey', 'Elaine', 'F', 19500, '1994-10-20', 'Chiapas'),
('SUPH830630HTBMMR16', 'Scott', 'Summers', 'Philip', 'M', 14800, '1983-06-30', 'Tabasco'),
('POPV960115MYCTTS17', 'Pepper', 'Potts', 'Virginia', 'F', 18800, '1996-01-15', 'Yucatán'),
('ROGS180704HSLGRS18', 'Steven', 'Rogers', 'Grant', 'M', 16200, '1918-07-04', 'Sinaloa'),
('ROMN841122MSRMFF19', 'Natasha', 'Romanoff', 'Ivan', 'F', 17800, '1984-11-22', 'Sonora'),
('PISB920712MCHNZN20', 'Beatriz', 'Pinzón', 'Solano', 'F', 15900, '1992-07-12', 'Chihuahua'),
('MESA850418HCLNDZ21', 'Armando', 'Mendoza', 'Sáenz', 'M', 22000, '1985-04-18', 'Coahuila'),
('COCM980905MDGLLC22', 'Mia', 'Colucci', 'Caceres', 'F', 14200, '1998-09-05', 'Durango'),
('PARR981222MZCARD23', 'Roberta', 'Pardo', 'Rey', 'F', 18500, '1998-12-22', 'Zacatecas'),
('PEAM940314MAGRZA24', 'Marimar', 'Pérez', 'Aldama', 'F', 16500, '1994-03-14', 'Aguascalientes'),
('LOFL910628HNYPZZ25', 'Luis', 'López', 'Fernando', 'M', 17200, '1991-06-28', 'Nayarit'),
('BRCD931009HCLCHD26', 'Carlos', 'Bracho', 'Daniel', 'M', 25000, '1993-10-09', 'Colima'),
('BRAM950217MTLCHH27', 'Paola', 'Bracho', 'Montaner', 'F', 24000, '1995-02-17', 'Tlaxcala'),

('SNST870530HMSRNN28', 'Jon', 'Snow', 'Stark', 'M', 16000, '1987-05-30', 'Morelos'),
('TAST890923MBCRGG29', 'Daenerys', 'Targaryen', 'Storm', 'F', 17000, '1989-09-23', 'Baja California'),
('LATY800104HBSRNN30', 'Tyrion', 'Lannister', 'Tywin', 'M', 15500, '1980-01-04', 'Baja California Sur'),
('STTA000819MCCRRK31', 'Arya', 'Stark', 'Tully', 'F', 19000, '2000-08-19', 'Campeche'),
('ELAA831111HHGSSR32', 'Aragorn', 'Elessar', 'Arathorn', 'M', 14500, '1983-11-11', 'Hidalgo'),
('GRET000327HSLNNF33', 'Legolas', 'Greenleaf', 'Thranduil', 'M', 18200, '1990-03-27', 'San Luis Potosí'),

('FLKE800706HTMNNN34', 'Kevin', 'Flynn', 'Encom', 'M', 16800, '1980-07-06', 'Tamaulipas'),
('FLSK901015HQRNNN35', 'Sam', 'Flynn', 'Kevin', 'M', 17500, '1990-10-15', 'Quintana Roo'),
('ANTN990331HDFNDR36', 'Thomas', 'Anderson', 'Neo', 'M', 15200, '1999-03-31', 'Ciudad de México'),
('MOMT990902MEXSSS37', 'Trinity', 'Moss', 'Matrix', 'F', 19500, '1999-09-02', 'Estado de México'),

('KEDA970401HJCCHM38', 'Ash', 'Ketchum', 'Delia', 'M', 14800, '1997-04-01', 'Jalisco'),
('WACE980425MNLTFF39', 'Misty', 'Waterflower', 'Cerulean', 'F', 18800, '1998-04-25', 'Nuevo León'),
('YASO960228HPLGMM40', 'Light', 'Yagami', 'Soichiro', 'M', 16200, '1996-02-28', 'Puebla'),
('LAWA901031HVZWWT41', 'L', 'Lawiet', 'Watari', 'M', 25000, '1990-10-31', 'Veracruz'),
('ACYE990210MYCKRR42', 'Mikasa', 'Ackerman', 'Yeager', 'F', 15900, '1999-02-10', 'Yucatán'),
('YEGR990330HGTGRR43', 'Eren', 'Yeager', 'Grisha', 'M', 19200, '1999-03-30', 'Guanajuato'),
('ACKE851225HCSKKN44', 'Levi', 'Ackerman', 'Kenny', 'M', 22000, '1985-12-25', 'Chiapas'),
('TSSE940630MOXSSK45', 'Usagi', 'Tsukino', 'Serenity', 'F', 18500, '1994-06-30', 'Oaxaca'),
('HIMA940417MQTNNN46', 'Rei', 'Hino', 'Mars', 'F', 16500, '1994-04-17', 'Querétaro'),
('IKGE010606HTBKKR47', 'Shinji', 'Ikari', 'Gendo', 'M', 14000, '2001-06-06', 'Tabasco'),
('LASO011204MSNGLL48', 'Asuka', 'Langley', 'Soryu', 'F', 15000, '2001-12-04', 'Sonora'),
('AYLI010330MCHYNN49', 'Rei', 'Ayanami', 'Lilith', 'F', 14000, '2001-03-30', 'Chihuahua'),
('KADR861208MCLTSG50', 'Misato', 'Katsuragi', 'Dr', 'F', 18000, '1986-12-08', 'Coahuila')
ON CONFLICT DO NOTHING;

-- Generar Teléfonos para todos 
INSERT INTO Telefono (CURP, Telefono)
SELECT C.CURP, '55' || floor(random() * 89999999 + 10000000)::text
FROM Conductor C 
WHERE NOT EXISTS (SELECT 1 FROM Telefono T WHERE T.CURP = C.CURP)
ON CONFLICT DO NOTHING;




/*
   -----------------------------------------------------------------------------------
   BLOQUE 2: GENERACIÓN SINTÉTICA DE TRENES
   -----------------------------------------------------------------------------------
   Justificación:
   Se requiere distribuir cantidades exactas de trenes por línea.
   En lugar de 400 inserts manuales, se implementó un algoritmo generativo.
   
   Lógica del Algoritmo:
   1. Tabla Derivada (VALUES): Define la configuración de distribución (Linea, Cantidad).
   2. CROSS JOIN LATERAL + generate_series: Expande la configuración en filas individuales.
   3. ID Lógico: '(Linea * 1000) + seq'. Permite identificar visualmente 
      la línea del tren.
   4. Asignación de Marcas con Probabilidad: 
      'CASE WHEN random() > 0.5'. Simula una distribución  de probabilidad Bernoulli para 
	   asignar marcas (Bombardier/CAF) aleatoriamente.
	   
	   psst...mire profe de proba, de algo sirvió lo que me enseñó, shootout a fernando rojas 
*/

-- =====================================================================================
-- 2. TRENES
-- =====================================================================================

-- 2.1 Generación Masiva 
INSERT INTO Tren (IDTren, NumeroLinea, Marca, Estatus, Vagones, AnioFabrica) VALUES (1005, 1, 'Bombardier', FALSE, 9, 2010) ON CONFLICT DO NOTHING;
INSERT INTO Tren (IDTren, NumeroLinea, Marca, Estatus, Vagones, AnioFabrica) VALUES (2001, 2, 'Bombardier', TRUE, 9, 2015) ON CONFLICT DO NOTHING;
INSERT INTO Tren (IDTren, NumeroLinea, Marca, Estatus, Vagones, AnioFabrica) VALUES (1040, 1, 'CAF', TRUE, 9, 2018) ON CONFLICT DO NOTHING;
INSERT INTO Tren (IDTren, NumeroLinea, Marca, Estatus, Vagones, AnioFabrica) VALUES (1041, 1, 'CAF', FALSE, 9, 2019) ON CONFLICT DO NOTHING;
INSERT INTO Tren (IDTren, NumeroLinea, Marca, Estatus, Vagones, AnioFabrica) VALUES (1015, 1, 'Alstom', TRUE, 10, 2021) ON CONFLICT DO NOTHING;
INSERT INTO Tren (IDTren, NumeroLinea, Marca, Estatus, Vagones, AnioFabrica) VALUES (1016, 1, 'Alstom', TRUE, 10, 2021) ON CONFLICT DO NOTHING;

-- 3.2 Generación del Resto
INSERT INTO Tren (IDTren, NumeroLinea, Marca, Estatus, Vagones, AnioFabrica)
SELECT 
    (config.Linea * 1000) + seq, 
    config.Linea, 
    CASE WHEN random() > 0.5 THEN 'Bombardier' ELSE 'CAF' END, 
    TRUE, 9, 2000 + floor(random() * 24)::int
FROM ( VALUES (1, 49), (2, 30), (3, 55), (4, 15), (5, 27), (6, 13), 
              (7, 38), (8, 28), (9, 33), (12, 25), (10, 36), (11, 38) ) AS config(Linea, Cantidad)
CROSS JOIN LATERAL generate_series(1, config.Cantidad) AS seq
WHERE ((config.Linea * 1000) + seq) NOT IN (1005, 2001, 1040, 1041, 1015, 1016)
ON CONFLICT DO NOTHING;

/*
   -----------------------------------------------------------------------------------
   BLOQUE 3: INFRAESTRUCTURA DEPENDIENTE
   -----------------------------------------------------------------------------------
   - Accesos: Se utiliza 'floor(random() * 3) + 4' para cumplir estrictamente la condición 
     que exige entre 4 y 6 accesos por estación de forma variable.
   - Hangares: Se aplica un filtrado 'WHERE IN (...)' para asignar hangares solo a 
     estaciones que operativamente funcionan como terminales o depósitos.
*/

-- =====================================================================================
-- 3. INFRAESTRUCTURA SECUNDARIA (Accesos y Hangares)
-- =====================================================================================
INSERT INTO Acceso (NumeroAcceso, NumeroEstacion, HoraApertura, HoraCierre)
SELECT 
    (E.NumeroEstacion * 100) + seq, 
    E.NumeroEstacion, 
    CASE 
        WHEN seq = 1 THEN '06:00:00'::TIME
        ELSE '05:00:00'::TIME
    END, 
    '00:00:00'::TIME
FROM Estacion E 
CROSS JOIN LATERAL generate_series(1, 4) AS seq 
ON CONFLICT DO NOTHING;

INSERT INTO Hangar (IDHangar, NumeroEstacion)
SELECT NumeroEstacion * 10, NumeroEstacion FROM Estacion 
WHERE NombreEstacion IN (
'Pantitlán', 
'Observatorio', 
'Cuatro Caminos', 
'Tasqueña', 
'Indios Verdes', 
'Universidad', 
'El Rosario', 
'Barranca del Muerto', 
'Tláhuac', 
'Mixcoac' )
ON CONFLICT DO NOTHING;

INSERT INTO Conectar (NumeroEstacion, IDServicio) 
VALUES (101, 4), (301, 1), (103, 3)



ON CONFLICT DO NOTHING;


/*
   -----------------------------------------------------------------------------------
   BLOQUE 4: INYECCIÓN DE CASOS DE PRUEBA Y ASIGNACIÓN
   -----------------------------------------------------------------------------------
   Justificación Técnica:
   Para hacer las consultas del ejercicio, la aleatoriedad no es suficiente.
   Se utilizó 'Data Seeding' determinista paara inyectar ciertos datos controladamente.
   
   Objetivos:
   1. Inyectar perfiles específicos (ej. 'Simón', 'Alonso') requeridos 
      por los ejercicios del prof.
   2. Simular fallas operativas poniendo trenes con Estatus=FALSE.
   3. Garantizar consistencia temporal en la asignación de turnos (Tabla Conducir).
   4.- Nuevaente se hacen inyecciones especiales para garantizar diversidad en las consultas
*/

-- =====================================================================================
-- 4. OPERACIÓN INTEGRAL: VINCULACIÓN, HISTORIA Y MANTENIMIENTO
-- Sintetiza la generación de contactos, asignación de turnos (actuales e históricos)
-- y la logística de mantenimiento y conexiones.
-- =====================================================================================

-- 4.1 GENERACIÓN DE CONTACTOS (Teléfonos)
-- Garantizamos que TODOS (así es, TODOS) los conductores tengan teléfono.
INSERT INTO Telefono (CURP, Telefono)
SELECT C.CURP, '55' || floor(random() * 89999999 + 10000000)::text
FROM Conductor C 
WHERE NOT EXISTS (SELECT 1 FROM Telefono T WHERE T.CURP = C.CURP)
ON CONFLICT DO NOTHING;



-- 4.2 ASIGNACIÓN DE TURNOS

-- Caso especial para la consulta h) --> se omite explícitamente el CURP 'AODF810729HDFLNR01' en los inserts.
-- Caso especial para la consulta f).
INSERT INTO Conducir (IDTren, CURP, HoraInicio, HoraFin, Fecha, Turno)
VALUES (1005, 'BORL510819MVZTRL03', '08:00:00', '16:00:00', CURRENT_DATE, 'M')
ON CONFLICT DO NOTHING;
-- Caso especial para la consulta k)
INSERT INTO Conducir (IDTren, CURP, HoraInicio, HoraFin, Fecha, Turno)
VALUES (1001, 'AODJ850106MJCXRA04', '14:00:00', '22:00:00', CURRENT_DATE, 'V')
ON CONFLICT DO NOTHING;
-- Caso especial para la consulta p)
INSERT INTO Conducir (IDTren, CURP, HoraInicio, HoraFin, Fecha, Turno)
VALUES (1040, 'PAMP950810HNLXRR05', '22:00:00', '05:00:00', CURRENT_DATE, 'N')
ON CONFLICT DO NOTHING;
-- Caso especial para la consulta q)
INSERT INTO Conducir (IDTren, CURP, HoraInicio, HoraFin, Fecha, Turno)
VALUES (2002, 'DIRS950505HPLNMR02', '06:00:00', '14:00:00', CURRENT_DATE, 'M')
ON CONFLICT DO NOTHING;



-- 4.3 ASIGNACIÓN DE TURNOS: HISTORIA GEEK (Q3 2024 - Consulta b)

INSERT INTO Conducir (IDTren, CURP, HoraInicio, HoraFin, Fecha, Turno)
VALUES (12001, 'WAMB850219HDFRYN06', '23:00:00', '06:00:00', '2024-08-15', 'N') ON CONFLICT DO NOTHING;
INSERT INTO Conducir (IDTren, CURP, HoraInicio, HoraFin, Fecha, Turno)
VALUES (12002, 'PRID881103MCZRNC07', '06:00:00', '13:00:00', '2024-09-10', 'M') ON CONFLICT DO NOTHING;
INSERT INTO Conducir (IDTren, CURP, HoraInicio, HoraFin, Fecha, Turno)
VALUES (12003, 'KEMC900722HPLRNT08', '14:00:00', '22:00:00', '2024-07-20', 'V') ON CONFLICT DO NOTHING;
INSERT INTO Conducir (IDTren, CURP, HoraInicio, HoraFin, Fecha, Turno)
VALUES (2005, 'PARR981222MZCARD23', '07:00:00', '15:00:00', '2024-08-01', 'M') ON CONFLICT DO NOTHING;



-- 4.4 ASIGNACIÓN MASIVA (RELLENO OPERATIVO)
-- Asigna aleatoriamente al resto de la plantilla, PROTEGIENDO el caso de h)
INSERT INTO Conducir (IDTren, CURP, HoraInicio, HoraFin, Fecha, Turno)
SELECT 
    T.IDTren, 
    (SELECT CURP FROM Conductor 
     WHERE CURP <> 'AODF810729HDFLNR01'   --- Excluimos a Fernando
     ORDER BY random() LIMIT 1),
    '06:00:00', '14:00:00', CURRENT_DATE, 'M'
FROM Tren T 
WHERE T.Estatus = TRUE 
  AND T.IDTren NOT IN (1005, 1001, 1040, 2002, 12001, 12002, 12003, 2005) -- No sobreescribir los asignados arriba
LIMIT 400
ON CONFLICT DO NOTHING;



-- 4.5 MANTENIMIENTO Y LOGÍSTICA (RESERVAS Y CONEXIONES)

INSERT INTO Conectar (NumeroEstacion, IDServicio) VALUES
(101, 4), (301, 1), (203, 3) -- Pantitlán(RTP), Indios Verdes(MB), Zócalo(Trole)
ON CONFLICT DO NOTHING;

--  Historial de Mantenimiento (Reservas)
INSERT INTO Reservar (IDTren, IDHangar, FechaInicio, FechaFin) 
VALUES (1040, 1010, '2024-12-01', '2024-12-10') ON CONFLICT DO NOTHING;

-- Consulta u)
INSERT INTO Reservar (IDTren, IDHangar, FechaInicio, FechaFin) 
VALUES (1041, 1010, '2024-10-01', NULL) ON CONFLICT DO NOTHING;
-- Consulta  j)
INSERT INTO Reservar (IDTren, IDHangar, FechaInicio, FechaFin) 
VALUES 
(2001, 1010, '2023-01-10', '2023-01-15'), 
(2001, 1010, '2023-07-20', '2023-07-25')  
ON CONFLICT DO NOTHING;
-- Consulta g)
INSERT INTO Reservar (IDTren, IDHangar, FechaInicio, FechaFin) 
VALUES (1002, 1010, '2024-02-01', '2024-02-10') ON CONFLICT DO NOTHING;
-- Consulta  m)
INSERT INTO Reservar (IDTren, IDHangar, FechaInicio) 
VALUES (2002, 1010, CURRENT_DATE) ON CONFLICT DO NOTHING;
