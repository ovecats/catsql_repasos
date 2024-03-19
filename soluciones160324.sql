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

 SELECT concat(profesor.nombre, ' ', profesor.apellido1, ' ', profesor.apellido2) AS Profesor, count(impartir.idAsignatura) AS materiasImpartidas
 FROM profesor INNER JOIN impartir ON profesor.idProfesor = impartir.idProfesor 
 GROUP BY impartir.idProfesor
 ORDER BY materiasImpartidas DESC;
 
 
 -- 6) Mostrar aquellos alumnos que tienen una media superior a 7.00 y su nota media
  SELECT concat(nombre, ' ', apellido1, ' ', apellido2) AS alumno, round(avg(matricula.nota),2) AS notaMedia
FROM alumno INNER JOIN matricula ON alumno.idAlumno = matricula.idAlumno
GROUP BY alumno.idAlumno
HAVING avg(matricula.nota) > 7.00 -- Filto de la agrupación alumno con una nota media superior a 7
ORDER BY notaMedia DESC;
 
 -- 7) Obtener los créditos totales por curso (con separación según caracter). El curso 6 tiene 0 créditos, al ser un doctorado las asignaturas no forman parte de la nota final
 
 -- 8) Obtener aquellas optativas sin alumnos
 
 -- 9) Obtener el número de alumnos de primero que tienen que recuperar cada asignatura
 
 -- 10) Alumnos que tienen que presentarse a la recuperación de Algebra lineal y la nota que sacaron 
 
 -- 11) Alumnos de segundo que han sacado un 10 en alguna materias para ponerles mención de honor. Ordenar alfabéticamente por nombre asignatura 
 
 -- 12) Conocer número de alumnos totales, los becados y porcentaje de becados respecto al total
 
 -- 13) Conocer nota media de los becados y el curso en el que están. Ordenar resultado por nombre completo descendiente
 
  -- 14) Queremos repartir un bonus a los 10 profesores con mejores medias en las asignaturas que imparten
  
  -- 15) Obtener toda la información de asignaturas que contienen la palabla 'datos' o 'progra' en su nombre. Ordenar por curso y luego por nombre
  
  -- 16) Obtener listado para enviar un comunicado oficial personalizado con el nombre a todas las personas de la universidad (alumnos y profesores)