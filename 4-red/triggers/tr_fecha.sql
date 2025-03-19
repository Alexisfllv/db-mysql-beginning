-- triggers

-- crera nueva columna a tabla nm para registrod e fechas

ALTER TABLE usuarios_grupos ADD COLUMN fecha_asignacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

DELIMITER //

CREATE TRIGGER before_insert_usuarios_grupos
BEFORE INSERT ON usuarios_grupos
FOR EACH ROW
BEGIN
    SET NEW.fecha_asignacion = NOW();
END;

//

DELIMITER ;

select * from usuarios_grupos;

-- tr para evitar insercion de mas de 3 grupos
-- no acepta mas registros que 3
DELIMITER //

CREATE TRIGGER before_insert_limitar_usuarios_grupos
BEFORE INSERT ON usuarios_grupos
FOR EACH ROW
BEGIN
    DECLARE total INT;
    SELECT COUNT(*) INTO total FROM usuarios_grupos WHERE usuario_id = NEW.usuario_id;
    
    IF total >= 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Un usuario no puede estar en más de 3 grupos';
    END IF;
END;

//

DELIMITER ;

INSERT INTO usuarios_grupos (usuario_id, grupo_id) VALUES (1, 1);

delete  from usuarios_grupos where usuarios_grupos_id = 1;
