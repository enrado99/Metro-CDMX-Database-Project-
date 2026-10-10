/*
   =====================================================================================
   PROYECTO: SISTEMA DE GESTIÓN METRO CDMX
   ARCHIVO:  03_Consultas.sql
   AUTOR:    Data Managers
   
   DESCRIPCIÓN:
   =====================================================================================
*/

-- -------------------------------------------------------------------------------------
-- (a) Mostrar el número de estaciones que se tienen por línea.
-- -------------------------------------------------------------------------------------
SELECT L.Nombre AS Linea, COUNT(P.NumeroEstacion) AS Total_Estaciones
FROM Linea L
JOIN Pertenecer P ON L.NumeroLinea = P.NumeroLinea
GROUP BY L.Nombre
ORDER BY Total_Estaciones DESC;

-- -------------------------------------------------------------------------------------
-- (b) Información de los conductores que condujeron en el horario de las 06:00 a las 13:00 
--     horas durante el tercer trimestre de 2024.
--     (Usamos los datos históricos inyectados de Batman, Wonder Woman, etc.)
-- -------------------------------------------------------------------------------------
SELECT DISTINCT C.Nombre, C.Paterno, CD.Fecha, CD.HoraInicio, CD.HoraFin
FROM Conductor C
JOIN Conducir CD ON C.CURP = CD.CURP
WHERE CD.HoraInicio >= '06:00:00' 
  AND CD.HoraFin <= '13:00:00'
  AND CD.Fecha BETWEEN '2024-07-01' AND '2024-09-30';

-- -------------------------------------------------------------------------------------
-- (c) Información de los trenes que entraron en reparación el día 07 de diciembre de 2024, 
--     indicando el hangar al que fueron enviados.
-- -------------------------------------------------------------------------------------
SELECT T.IDTren, T.Marca, H.IDHangar, R.FechaInicio
FROM Tren T
JOIN Reservar R ON T.IDTren = R.IDTren
JOIN Hangar H ON R.IDHangar = H.IDHangar
WHERE '2024-12-07' BETWEEN R.FechaInicio AND COALESCE(R.FechaFin, CURRENT_DATE);

-- -------------------------------------------------------------------------------------
-- (d) Información de los conductores mayores de 35 y menores de 60 años, 
--     que conducen trenes en líneas con número par.
-- -------------------------------------------------------------------------------------
SELECT DISTINCT C.Nombre, C.Paterno, EXTRACT(YEAR FROM AGE(CURRENT_DATE, C.Nacimiento)) AS Edad, L.Nombre
FROM Conductor C
JOIN Conducir CD ON C.CURP = CD.CURP
JOIN Tren T ON CD.IDTren = T.IDTren
JOIN Linea L ON T.NumeroLinea = L.NumeroLinea
WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, C.Nacimiento)) BETWEEN 35 AND 60
  AND (L.NumeroLinea % 2) = 0;

-- -------------------------------------------------------------------------------------
-- (e) Información de las estaciones que tienen accesos con horario diferente 
--     en que opera la estación correspondiente.
--     (Validado con la lógica del acceso #1 que abre a las 06:00 vs 05:00 de la estación)
-- -------------------------------------------------------------------------------------
SELECT E.NombreEstacion, E.HoraApertura AS Horario_Estacion, A.HoraApertura AS Horario_Acceso
FROM Estacion E
JOIN Acceso A ON E.NumeroEstacion = A.NumeroEstacion
WHERE A.HoraApertura <> E.HoraApertura 
   OR A.HoraCierre <> E.HoraCierre;

-- -------------------------------------------------------------------------------------
-- (f) Información de las conductoras que ganan entre $12,850 y $15,327 y que no están 
--     conduciendo porque su tren se mandó a reparar.
--     (Caso específico: Laura Bozzo)
-- -------------------------------------------------------------------------------------
SELECT C.Nombre, C.Paterno, C.Salario, T.IDTren, T.Estatus
FROM Conductor C
JOIN Conducir CD ON C.CURP = CD.CURP
JOIN Tren T ON CD.IDTren = T.IDTren
WHERE C.Sexo = 'F'
  AND C.Salario BETWEEN 12850 AND 15327
  AND T.Estatus = FALSE;

-- -------------------------------------------------------------------------------------
-- (g) Indicar el número de días que los trenes de las líneas impares estuvieron en 
--     reparación durante el primer semestre 2024.
-- -------------------------------------------------------------------------------------
SELECT T.IDTren, SUM(COALESCE(R.FechaFin, CURRENT_DATE) - R.FechaInicio) AS Dias_Reparacion
FROM Tren T
JOIN Reservar R ON T.IDTren = R.IDTren
WHERE (T.NumeroLinea % 2) <> 0
  AND R.FechaInicio BETWEEN '2024-01-01' AND '2024-06-30'
GROUP BY T.IDTren;

-- -------------------------------------------------------------------------------------
-- (h) Información de los conductores que no están asignados a ningún tren, 
--     cuyo primer apellido sea ALONSO.
--     (Caso específico: Fernando Alonso)
-- -------------------------------------------------------------------------------------
SELECT C.CURP, C.Nombre, C.Paterno
FROM Conductor C
LEFT JOIN Conducir CD ON C.CURP = CD.CURP
WHERE C.Paterno = 'Alonso'
  AND CD.IDTren IS NULL;

-- -------------------------------------------------------------------------------------
-- (i) Información de las estaciones que tienen conexión a otro servicio de transporte.
-- -------------------------------------------------------------------------------------
SELECT E.NombreEstacion, S.Nombre AS Servicio, S.Tipo
FROM Estacion E
JOIN Conectar CO ON E.NumeroEstacion = CO.NumeroEstacion
JOIN Servicio S ON CO.IDServicio = S.IDServicio;

-- -------------------------------------------------------------------------------------
-- (j) Reservaciones de trenes Bombardier durante los trimestres impares 2023.
-- -------------------------------------------------------------------------------------
SELECT T.IDTren, T.Marca, R.FechaInicio, R.FechaFin
FROM Tren T
JOIN Reservar R ON T.IDTren = R.IDTren
WHERE T.Marca = 'Bombardier'
  AND EXTRACT(YEAR FROM R.FechaInicio) = 2023
  AND EXTRACT(QUARTER FROM R.FechaInicio) IN (1, 3);

-- -------------------------------------------------------------------------------------
-- (k) Conductoras de entre 35 y 45 años, horario VESPERTINO.
--     (Caso específico: Juana de Arco)
-- -------------------------------------------------------------------------------------
SELECT C.Nombre, C.Paterno, CD.Turno
FROM Conductor C
JOIN Conducir CD ON C.CURP = CD.CURP
WHERE C.Sexo = 'F'
  AND EXTRACT(YEAR FROM AGE(CURRENT_DATE, C.Nacimiento)) BETWEEN 35 AND 45
  AND CD.Turno = 'V';

-- -------------------------------------------------------------------------------------
-- (l) Mostrar el total de trenes por línea, marca y estatus.
-- -------------------------------------------------------------------------------------
SELECT L.Nombre AS Linea, T.Marca, T.Estatus, COUNT(*) AS Total
FROM Tren T
JOIN Linea L ON T.NumeroLinea = L.NumeroLinea
GROUP BY L.Nombre, T.Marca, T.Estatus
ORDER BY L.Nombre;

-- -------------------------------------------------------------------------------------
-- (m) Reservaciones y trenes por hangar, para las estaciones pares.
-- -------------------------------------------------------------------------------------
SELECT H.IDHangar, E.NombreEstacion, T.IDTren, R.FechaInicio
FROM Hangar H
JOIN Estacion E ON H.NumeroEstacion = E.NumeroEstacion
JOIN Reservar R ON H.IDHangar = R.IDHangar
JOIN Tren T ON R.IDTren = T.IDTren
WHERE (E.NumeroEstacion % 2) = 0;

-- -------------------------------------------------------------------------------------
-- (n) Información de las estaciones que no tienen ningún hangar asociado.
-- -------------------------------------------------------------------------------------
SELECT E.NumeroEstacion, E.NombreEstacion
FROM Estacion E
LEFT JOIN Hangar H ON E.NumeroEstacion = H.NumeroEstacion
WHERE H.IDHangar IS NULL;

-- -------------------------------------------------------------------------------------
-- (o) Número de conductores mayores de 38 años, por estado de procedencia y sexo.
-- -------------------------------------------------------------------------------------
SELECT Estado, Sexo, COUNT(*) AS Total_Conductores
FROM Conductor
WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, Nacimiento)) > 38
GROUP BY Estado, Sexo
ORDER BY Estado;

-- -------------------------------------------------------------------------------------
-- (p) Conductores 25-45 años, Tren CAF, Turnos MATUTINO o NOCTURNO.
--     (Caso específico: Spiderman / Peter Parker)
-- -------------------------------------------------------------------------------------
SELECT DISTINCT C.Nombre, C.Paterno, T.Marca, CD.Turno
FROM Conductor C
JOIN Conducir CD ON C.CURP = CD.CURP
JOIN Tren T ON CD.IDTren = T.IDTren
WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, C.Nacimiento)) BETWEEN 25 AND 45
  AND T.Marca = 'CAF'
  AND CD.Turno IN ('M', 'N');

-- -------------------------------------------------------------------------------------
-- (q) Conductores cadena "SIMÓN", ganen menos que el promedio.
--     (Caso específico: Simón Dice)
-- -------------------------------------------------------------------------------------
SELECT C.Nombre, C.Paterno, C.Salario
FROM Conductor C
WHERE C.Nombre LIKE '%Simón%'
  AND C.Salario < (SELECT AVG(Salario) FROM Conductor);

-- -------------------------------------------------------------------------------------
-- (r) Trenes que tengan 10 vagones que sean de la marca Alstom.
-- -------------------------------------------------------------------------------------
SELECT * FROM Tren WHERE Vagones = 10 AND Marca = 'Alstom';

-- -------------------------------------------------------------------------------------
-- (s) Conductores que manejen trenes con año de fabricación posterior al 2020.
-- -------------------------------------------------------------------------------------
SELECT DISTINCT C.Nombre, C.Paterno, T.AnioFabrica
FROM Conductor C
JOIN Conducir CD ON C.CURP = CD.CURP
JOIN Tren T ON CD.IDTren = T.IDTren
WHERE T.AnioFabrica > 2020;

-- -------------------------------------------------------------------------------------
-- (t) Lista de conductores cuyo apellido paterno comience con A, D, G, J, L, P o R.
--     (Aquí es donde brilla el elenco Geek: Parker, Rogers, Logan, etc.)
-- -------------------------------------------------------------------------------------
SELECT Nombre, Paterno FROM Conductor 
WHERE Paterno ~ '^[ADGJLPR]'; -- Uso de Regex para eficiencia

-- -------------------------------------------------------------------------------------
-- (u) Trenes que al día 31 de octubre de 2024 no hayan salido de reparación.
-- -------------------------------------------------------------------------------------
SELECT T.IDTren, R.FechaInicio, R.FechaFin
FROM Tren T
JOIN Reservar R ON T.IDTren = R.IDTren
WHERE R.FechaInicio <= '2024-10-31'
  AND (R.FechaFin IS NULL OR R.FechaFin > '2024-10-31');

-- -------------------------------------------------------------------------------------
-- (v) Reporte de número de reparaciones por marca.
-- -------------------------------------------------------------------------------------
SELECT T.Marca, COUNT(*) AS Total_Reparaciones
FROM Tren T
JOIN Reservar R ON T.IDTren = R.IDTren
GROUP BY T.Marca;


-- (w) Incrementar en un 15% el salario de los conductores entre 35 y 45 años.
UPDATE Conductor 
SET Salario = Salario * 1.15 
WHERE EXTRACT(YEAR FROM AGE(CURRENT_DATE, Nacimiento)) BETWEEN 35 AND 45;

-- (x) Borrar información de trenes BOMBARDIER con más de 35 años de servicio.
--     (Asumiendo año actual 2025: Fabricados antes de 1990)
DELETE FROM Tren 
WHERE Marca = 'Bombardier' 
  AND (2025 - AnioFabrica) > 35;

-- (y) Insertar flota de 20 trenes CAF 2024 en Líneas 1 y 3.
--     (Usamos IDs > 20000 para evitar conflictos con los existentes)
INSERT INTO Tren (IDTren, NumeroLinea, Marca, Estatus, Vagones, AnioFabrica)
SELECT 
    20000 + seq, 
    CASE WHEN seq % 2 = 0 THEN 1 ELSE 3 END, -- Alternar líneas
    'CAF', 
    TRUE, 
    9, 
    2024
FROM generate_series(1, 20) AS seq;
