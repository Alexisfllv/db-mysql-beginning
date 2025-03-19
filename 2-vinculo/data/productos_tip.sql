use beginning;


drop table if exists productos;


create table tipo_producto(
tipo_producto_id int primary key auto_increment,
nombre varchar(100) not null
);

INSERT INTO tipo_producto (nombre) VALUES ('Bebidas'), ('Electrónicos'), ('Ropa');

select * from tipo_producto;

create table productos(
	producto_id int primary key auto_increment,
    producto_nombre varchar(100) not null,
    producto_cantidad int default null,
    producto_peso decimal(10,3) default null,
    producto_fecha_inicio datetime not null default current_timestamp,
    producto_fecha_fin datetime generated always as (date_add(producto_fecha_inicio, interval 3 day)) virtual,
    tipo_producto_id int not null,
    foreign key (tipo_producto_id) references tipo_producto(tipo_producto_id)
);

describe productos;

INSERT INTO productos (producto_nombre, producto_cantidad, producto_peso,tipo_producto_id)
VALUES 
('Pollo', NULL, 2.500,1), 
('Lechuga', NULL, 1.200,1), 
('Huevos', 12, NULL,3);

select * from productos;

select * from tipo_producto;


drop trigger if exists tr_consultas;






