use beginning;


drop table if exists productos_refrigerados;
create table productos_refrigerados(
	producto_id int primary key auto_increment,
    producto_nombre varchar(100) not null,
    producto_cantidad int default null,
    producto_peso decimal(10,3) default null,
    producto_fecha_inicio datetime not null default current_timestamp,
    producto_fecha_fin datetime generated always as (date_add(producto_fecha_inicio, interval 3 day)) virtual
);

describe productos_refrigerados;

INSERT INTO productos_refrigerados (producto_nombre, producto_cantidad, producto_peso)
VALUES 
('Pollo', NULL, 2.500), 
('Lechuga', NULL, 1.200), 
('Huevos', 12, NULL);







