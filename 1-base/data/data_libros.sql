-- creacion de tabla base libro

drop table if exists libros;

create table libros(
libro_id int auto_increment primary key,
libro_titulo varchar(60) not null,
libro_autor varchar(80) not null,
libro_fecha_publicacion date not null
);

describe libros; -- adaptado para un libro


insert into libros
(libro_titulo, libro_autor, libro_fecha_publicacion) values
('Cien años de soledad', 'Gabriel García Márquez', '1967-05-30'),
('1984', 'George Orwell', '1949-06-08'),
('Don Quijote de la Mancha', 'Miguel de Cervantes', '1605-01-16'),
('El Principito', 'Antoine de Saint-Exupéry', '1943-04-06'),
('Crónica de una muerte anunciada', 'Gabriel García Márquez', '1981-03-01');

select * from libros;