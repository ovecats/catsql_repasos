USE facultad;

-- 1) Caracter, nº de alumnos, nota mínima, máxima y media de las asignaturas.
-- Ordenar el resultado por curso primero y nombre de la asignatura después.
select curso, nombre, caracter, count(nota) AS "alumnos", round(min(nota),2) AS "nota minima", round(max(nota),2) AS "nota maxima", round(avg(nota),2) AS "nota promedio"
from asignatura, matricula
where asignatura.idasignatura = matricula.idasignatura
group by asignatura.nombre
order by asignatura.curso ASC, asignatura.nombre ASC;

-- 2) Asignaturas con una nota media inferior a 5, ordena por curso y posteriormente ordena por nombre ascendente.
SELECT curso, nombre, round(avg(nota),2) AS 'Nota Media'
FROM asignatura, matricula
WHERE matricula.idAsignatura = asignatura.idAsignatura 
GROUP BY asignatura.nombre
HAVING avg(nota) < 5.00
ORDER BY curso ASC, nombre ASC;

-- 3) Conocer el número de profesores por categoría  y ordenar la tabla de categoría con más profesores a categoría con menos
SELECT categoria, count(idProfesor) as "profesores" 
FROM facultad.profesor
group by categoria
order by Profesores desc;

-- 4) Conocer curso, asignatura, caracter de la asignatura, coordinador y e-mail de contacto
SELECT asignatura.curso AS curso, asignatura.nombre AS asignatura, asignatura.caracter AS caracter,
concat(profesor.nombre, ' ', profesor.apellido1, ' ', profesor.apellido2) AS coordinador, email
FROM asignatura INNER JOIN profesor ON (profesor.idProfesor = asignatura.coordinador)
ORDER BY curso ASC, asignatura ASC;


-- 5) Asignaturas impartidas por profesor de más a menos