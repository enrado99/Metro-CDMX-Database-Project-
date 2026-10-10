/*
   =====================================================================================
   PROYECTO DEL METRO CDMX
   ARCHIVO:  01_Esquema_DDL.sql
   AUTOR:    Data Managers (Consultoría Actuarial & Datos)
   FECHA:    27/11/2025
   
   POLÍTICAS DE MANTENIMIENTO:
   1. ON DELETE CASCADE: Para las entidades cuya existencia depende totalmente de su padre 
      (ej. Accesos de una Estación, Teléfonos de un Conductor).
   2. ON DELETE RESTRICT: Para evitar la eliminación accidental de catálogos críticos 
      que tienen activos asignados (ej. Líneas con Trenes, Estaciones con Hangares).
   =====================================================================================
*/

-- =====================================================================================
--   LIMPIEZA DE ENTORNO 
-- Eliminamos las tablas si existen para evitar conflictos al re-ejecutar.
-- Se usa CASCADE para eliminar dependencias automáticamente.
-- =====================================================================================
DROP TABLE IF EXISTS Conectar CASCADE;
DROP TABLE IF EXISTS Reservar CASCADE;
DROP TABLE IF EXISTS Conducir CASCADE;
DROP TABLE IF EXISTS Pertenecer CASCADE;
DROP TABLE IF EXISTS Telefono CASCADE;
DROP TABLE IF EXISTS Acceso CASCADE;
DROP TABLE IF EXISTS Hangar CASCADE;
DROP TABLE IF EXISTS Tren CASCADE;
DROP TABLE IF EXISTS Servicio CASCADE;
DROP TABLE IF EXISTS Conductor CASCADE;
DROP TABLE IF EXISTS Estacion CASCADE;
DROP TABLE IF EXISTS Linea CASCADE;

-- =====================================================================================
--   TABLAS DE CATÁLOGO (Entidades Claves)
-- =====================================================================================

-- Tabla: Linea
-- Propósito: Catálogo maestro de las líneas operativas.
CREATE TABLE Linea (
    NumeroLinea INT PRIMARY KEY,          -- Identificador numérico único.
    Nombre VARCHAR(100) NOT NULL UNIQUE   -- Nombre descriptivo (ej. "Línea 1"). Único y obligatorio.
);

-- Tabla: Estacion
-- Proporciona puntos de ascenso/descenso e infraestructura fija.
CREATE TABLE Estacion (
    NumeroEstacion INT PRIMARY KEY,
    JefeEstacion VARCHAR(150),            			-- Responsable administrativo.
    NombreEstacion VARCHAR(100) NOT NULL UNIQUE,    -- Identificador nominal único.
    HoraApertura TIME NOT NULL,          		    -- Horario operativo inicio.
    HoraCierre TIME NOT NULL,                       -- Horario operativo fin.
    Telefono VARCHAR(15)                            -- Contacto administrativo.
);

-- Tabla: Conductor
-- Proporciona el capital humano operativo.
CREATE TABLE Conductor (
    CURP VARCHAR(18) PRIMARY KEY,         -- Identificador fiscal único.
    Nombre VARCHAR(100) NOT NULL,
    Paterno VARCHAR(100) NOT NULL,
    Materno VARCHAR(100),
    --  Validación de sexo biológico o administrativo.
    Sexo CHAR(1) CHECK (Sexo IN ('M', 'F')), 
    -- El salario no puede ser negativo ni cero .
    Salario NUMERIC(10, 2) NOT NULL CHECK (Salario > 0), 
    Nacimiento DATE,
    Estado VARCHAR(100)                   -- Estatus laboral (Activo/Baja/Incapacidad).
);

-- Tabla: Servicio
-- Propósito: Catálogo de intermodalidad (conexiones externas).
CREATE TABLE Servicio (
    IDServicio INT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,         -- Ejemplo. "Metrobús Línea 1".
    Tipo VARCHAR(100)                     -- Ejemplo. "RTP", "Trolebús".
);

-- =====================================================================================
--     TABLAS DEPENDIENTES
-- =====================================================================================

-- Tabla: Tren
-- Indica si paertenece a una Linea 
CREATE TABLE Tren (
    IDTren INT PRIMARY KEY,
    NumeroLinea INT NOT NULL,
    Marca VARCHAR(100),
    -- Default: Se asume operativo al alta.
    Estatus BOOLEAN DEFAULT TRUE,         
    -- Validación física: Un tren debe tener vagones.
    Vagones INT CHECK (Vagones > 0),      
    AnioFabrica INT,
    
    -- Política de Integridad:
    -- No se puede eliminar una Línea si tiene Trenes inventariados.
    FOREIGN KEY (NumeroLinea) REFERENCES Linea(NumeroLinea)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Tabla: Hangar
-- indica si está ubicado en una Estacion.
CREATE TABLE Hangar (
    IDHangar INT PRIMARY KEY,
    NumeroEstacion INT NOT NULL,
    
    -- Política de Integridad:
    -- Protege la infraestructura. No borra la estación si hay hangares registrados.
    FOREIGN KEY (NumeroEstacion) REFERENCES Estacion(NumeroEstacion)
        ON UPDATE CASCADE
        ON DELETE RESTRICT
);

-- Tabla: Acceso
-- Indica si hay una entrada física a una Estacion.
CREATE TABLE Acceso (
    NumeroAcceso INT PRIMARY KEY,
    NumeroEstacion INT NOT NULL,
    HoraApertura TIME NOT NULL,
    HoraCierre TIME NOT NULL,
    
    -- Política de Integridad:
    -- CASCADE: Dependencia de existir. Si la estación desaparece, sus accesos también.
    FOREIGN KEY (NumeroEstacion) REFERENCES Estacion(NumeroEstacion)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- Tabla: Telefono
-- Indica el atributo multivaluado de Conductor.
CREATE TABLE Telefono (
    CURP VARCHAR(18) NOT NULL,
    Telefono CHAR(10) NOT NULL,
    
    --  Un conductor no puede registrar dos veces el mismo número.
    PRIMARY KEY (CURP, Telefono),
    
    -- Política de Integridad:
    -- CASCADE: Si el conductor es eliminado del sistema, sus teléfonos son irrelevantes.
    FOREIGN KEY (CURP) REFERENCES Conductor(CURP)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- =====================================================================================
-- 	 TABLAS ASOCIATIVAS
-- =====================================================================================

-- Tabla: Pertenecer
-- Indica el mapeo de la red (Qué estaciones conforman qué línea).
CREATE TABLE Pertenecer (
    NumeroLinea INT NOT NULL,
    NumeroEstacion INT NOT NULL,
    PRIMARY KEY (NumeroLinea, NumeroEstacion),
    
    -- CASCADE: Si se elimina la entidad, se elimina su relación en la red.
    FOREIGN KEY (NumeroLinea) REFERENCES Linea(NumeroLinea) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (NumeroEstacion) REFERENCES Estacion(NumeroEstacion) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Conducir
-- RIndica la asignación operativa (bitácora de manejo).
CREATE TABLE Conducir (
    IDTren INT NOT NULL,
    CURP VARCHAR(18) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFin TIME NOT NULL,
    Fecha DATE NOT NULL,
    Turno CHAR(1),
    
    -- PK Compuesta Temporal: Permite historicos (mismo conductor/tren en diferentes fechas).
    PRIMARY KEY (IDTren, CURP, Fecha, HoraInicio),
    
    FOREIGN KEY (IDTren) REFERENCES Tren(IDTren) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (CURP) REFERENCES Conductor(CURP) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Reservar
-- Nos dice sobre la logística de mantenimiento.
CREATE TABLE Reservar (
    IDTren INT NOT NULL,
    IDHangar INT NOT NULL,
    FechaInicio DATE NOT NULL,
    FechaFin DATE, -- Nullable: Nos dice si la reserva sigue vigente.
    
    PRIMARY KEY (IDTren, IDHangar, FechaInicio),
    
    FOREIGN KEY (IDTren) REFERENCES Tren(IDTren) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (IDHangar) REFERENCES Hangar(IDHangar) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Tabla: Conectar
-- Indica los transbordos intermodales.
CREATE TABLE Conectar (
    NumeroEstacion INT NOT NULL,
    IDServicio INT NOT NULL,
    
    PRIMARY KEY (NumeroEstacion, IDServicio),
    
    FOREIGN KEY (NumeroEstacion) REFERENCES Estacion(NumeroEstacion) ON UPDATE CASCADE ON DELETE CASCADE,
    FOREIGN KEY (IDServicio) REFERENCES Servicio(IDServicio) ON UPDATE CASCADE ON DELETE CASCADE
);

-- =====================================================================================
--  	 VISUALIZADOR DE TABLAS 
-- Estas consultas confirman que las tablas se crearon correctamente en el esquema 'public'.
-- =====================================================================================

SELECT * 
FROM Linea;

SELECT * 
FROM Estacion;

SELECT * 
FROM Conductor;

SELECT * 
FROM Servicio;

SELECT * 
FROM Tren;

SELECT * 
FROM Hangar;

SELECT * 
FROM Acceso;

SELECT * 
FROM Telefono;

SELECT * 
FROM Pertenecer;

SELECT * 
FROM Conducir;

SELECT * 
FROM Reservar;

SELECT * 
FROM Conectar;
