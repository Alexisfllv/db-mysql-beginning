-- vwCiudad
-- vw_direccion
drop view if exists vw_ciudad_d;

create view vw_ciudad_d as
SELECT 
    d.id_direccion,
    d.calle,
    c.id_ciudad,
    c.nombre AS ciudad,
    dp.id_departamento,
    dp.nombre AS departamento,
    p.id_pais,
    p.nombre AS pais
FROM Direccion d
JOIN Ciudad c ON d.id_ciudad = c.id_ciudad
JOIN Departamento dp ON c.id_departamento = dp.id_departamento
JOIN Pais p ON dp.id_pais = p.id_pais;

select * from vw_ciudad_d;
