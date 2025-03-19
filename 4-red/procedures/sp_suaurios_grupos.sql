-- SP

-- SP PARA EVITAR DATOS DUPLICADOS QUE NO SE INGRESEN  SI HAY DUPLICADOS

DELIMITER //

CREATE PROCEDURE InsertarUsuarioGrupo(
    IN p_usuario_id INT,
    IN p_grupo_id INT
)
BEGIN
    -- Verifica si la relación ya existe para evitar duplicados
    IF NOT EXISTS (
        SELECT 1 FROM usuarios_grupos WHERE usuario_id = p_usuario_id AND grupo_id = p_grupo_id
    ) THEN
        INSERT INTO usuarios_grupos (usuario_id, grupo_id) VALUES (p_usuario_id, p_grupo_id);
    END IF;
END;

//

DELIMITER ;


CALL InsertarUsuarioGrupo(1, 3); -- Asigna el usuario con ID 1 al grupo con ID 1
CALL InsertarUsuarioGrupo(2, 3); -- Asigna el usuario con ID 2 al grupo con ID 3