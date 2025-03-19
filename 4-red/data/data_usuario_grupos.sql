
-- data_usuario red

drop table if exists usuarios,grupos,usuarios_grupos;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE grupos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE usuarios_grupos (
	usuarios_grupos_id int auto_increment primary key,
    usuario_id INT,
    grupo_id INT,
    UNIQUE (usuario_id, grupo_id),
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE,
    FOREIGN KEY (grupo_id) REFERENCES grupos(id) ON DELETE CASCADE
);


select * from usuarios;
select * from grupos;
select * from usuarios_grupos;


-- Insertar usuarios
INSERT INTO usuarios (nombre) VALUES 
('Juan Pérez'),
('María Gómez'),
('Carlos Fernández'),
('Ana López'),
('Pedro Ramírez');

-- Insertar grupos
INSERT INTO grupos (nombre) VALUES 
('Administradores'),
('Usuarios'),
('Moderadores'),
('Desarrolladores'),
('Marketing');

-- Insertar relaciones usuario-grupo (evitando duplicados por UNIQUE)
INSERT INTO usuarios_grupos (usuario_id, grupo_id) VALUES 
(1, 4), -- Juan Pérez -> Administradores
(1, 2), -- Juan Pérez -> Usuarios
(2, 2), -- María Gómez -> Usuarios
(3, 3), -- Carlos Fernández -> Moderadores
(4, 4), -- Ana López -> Desarrolladores
(5, 5), -- Pedro Ramírez -> Marketing
(2, 5), -- María Gómez -> Marketing
(3, 4); -- Carlos Fernández -> Desarrolladores












