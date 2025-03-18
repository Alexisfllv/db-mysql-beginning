-- creacion de trigger para registrar

-- tabla para auditoria de registros productos

CREATE TABLE productos_refrigerados_historial (
    historial_id INT PRIMARY KEY AUTO_INCREMENT,
    producto_id INT NOT NULL,
    producto_nombre VARCHAR(100) NOT NULL,
    producto_fecha_inicio DATETIME NOT NULL,
    producto_fecha_fin DATETIME NOT NULL,
    fecha_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP -- Marca cuándo se guardó en la auditoría
);

select * from productos_refrigerados_historial;

SELECT * FROM productos_refrigerados;

drop trigger if exists tr_before_insert_productos_refrigerados;

delimiter //
create trigger tr_before_insert_productos_refrigerados
	after insert on productos_refrigerados
    for each row
begin
	insert into productos_refrigerados_historial (producto_id, producto_nombre, producto_fecha_inicio, producto_fecha_fin)
    values (NEW.producto_id, NEW.producto_nombre, NEW.producto_fecha_inicio, NEW.producto_fecha_fin);
end //

delimiter ;

INSERT INTO productos_refrigerados (producto_nombre, producto_cantidad, producto_peso)
VALUES 
('pescado', NULL, 5.200);