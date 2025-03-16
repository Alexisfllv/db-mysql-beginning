-- SP

--
drop procedure if exists sp_libros_fechas_multiples;

delimiter //
create procedure sp_libros_fechas_multiples()
begin
	select libro_titulo, libro_fecha_publicacion from libros;
end //
delimiter ;

call sp_libros_fechas_multiples();

-- prod averiguar cuanto tiempo de permiso
drop procedure if exists sp_libros_verificar_permiso;

delimiter //
create procedure sp_libros_verificar_permiso(
	in in_libro_id int,
    out diferencia varchar(60)
    )
begin
	select concat(
    timestampdiff(year, current_date(),libro_fecha_publicacion),' años, ',
    timestampdiff(month, current_date() ,libro_fecha_publicacion) % 12, ' meses, ',
    datediff(current_date(), date_add(libro_fecha_publicacion,
    interval timestampdiff(year,current_date(), libro_fecha_publicacion ) year )),' dias ')
    into diferencia 
    from libros 
    where in_libro_id = libro_id;
end //
delimiter ;

call sp_libros_verificar_permiso(1,@diferencia);

select @diferencia;