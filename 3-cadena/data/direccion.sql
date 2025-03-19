-- db cadena > Direccion

drop table if exists pais,departamento,ciudad,direccion;

CREATE TABLE Pais (
    id_pais INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pais INT,
    nombre VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_pais) REFERENCES Pais(id_pais)
);

CREATE TABLE Ciudad (
    id_ciudad INT PRIMARY KEY AUTO_INCREMENT,
    id_departamento INT,
    nombre VARCHAR(100) NOT NULL,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento)
);

CREATE TABLE Direccion (
    id_direccion INT PRIMARY KEY AUTO_INCREMENT,
    id_ciudad INT,
    calle VARCHAR(255) NOT NULL,
    FOREIGN KEY (id_ciudad) REFERENCES Ciudad(id_ciudad)
);


-- 4 Pais
INSERT INTO Pais (nombre) VALUES 
('Perú'),
('Argentina'),
('México');

-- 3 Departamento
INSERT INTO Departamento (id_pais, nombre) VALUES 
(1, 'Lima'),       -- Perú
(1, 'Arequipa'),   -- Perú
(2, 'Buenos Aires'), -- Argentina
(3, 'CDMX');       -- México

select * from departamento;

-- 2 Ciudad
INSERT INTO Ciudad (id_departamento, nombre) VALUES 
(1, 'Miraflores'),  -- Lima, Perú
(1, 'San Isidro'),  -- Lima, Perú
(2, 'Cayma'),       -- Arequipa, Perú
(3, 'La Plata'),    -- Buenos Aires, Argentina
(4, 'Coyoacán');    -- CDMX, México

select * from Ciudad;
-- direccion
INSERT INTO Direccion (id_ciudad, calle) VALUES 
(1, 'Av. Pardo 123'),    -- Miraflores
(2, 'Calle Los Robles 456'), -- San Isidro
(3, 'Av. Ejército 789'), -- Cayma
(4, 'Calle 12 1011'),    -- La Plata
(5, 'Av. Insurgentes 1314'); -- Coyoacán

select * from direccion;


