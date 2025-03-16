-- VW

drop view if exists vw_libros_nombres;

create view vw_libros_nombres as
select libro_id, libro_titulo from libros;

-- titulo
select * from vw_libros_nombres;

