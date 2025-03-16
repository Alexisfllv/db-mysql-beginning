-- TR


DELIMITER //
CREATE TRIGGER tr_libros_before_insert
BEFORE INSERT ON libros
FOR EACH ROW
BEGIN
    SET NEW.libro_titulo = UPPER(NEW.libro_titulo);
END;
// DELIMITER ;


