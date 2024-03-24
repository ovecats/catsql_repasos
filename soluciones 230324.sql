-- Las consultas realizadas será:
use facultad;
-- 01 -- Caracter, nº de alumnos, nota mínima, máxima y media de las asignaturas.
-- Ordenar el resultado por curso primero y nombre de la asignatura después.

SELECT curso, nombre, caracter, count(idAlumno) as "alumnos", round(min(nota),2) AS "nota minima", round(max(nota),2) AS "nota maxima",round(avg(nota),2) AS "nota media" 
from asignatura, matricula
where asignatura.idAsignatura=matricula.idAsignatura
group by nombre
order by curso, nombre;

-- 02  Asignaturas con una nota media inferior a 5 ordenar por curso y
-- posteriormente por nombre ascendente.

SELECT curso, nombre, round(avg(nota),2) as "promedio"
FROM asignatura, matricula
where asignatura.idAsignatura=matricula.idAsignatura
group by nombre
having avg(nota) < 5
order by curso asc, nombre asc;








* Conocer el número de profesores por categoría y ordenar la tabla de categoría con más profesores a categoría con menos.
* Conocer curso, asignatura, carácter de la asignatura, coordinador y e-mail de contacto.
* Asignaturas impartidas por profesor de más a menos.
* Mostrar aquellos alumnos que tienen una media superior a 7.00 y su nota media.
* Obtener los créditos totales por curso y carácter de la asignatura. El curso 6 tiene 0 créditos, al ser un doctorado las asignaturas no forman parte de la nota final.
* Obtener aquellas optativas sin alumnos.
* Obtener el número de alumnos de primero que tienen que recuperar cada asignatura.
* Alumnos que tienen que presentarse a la recuperación de Algebra lineal y la nota que sacaron.
* Alumnos de segundo que han sacado un 10 en alguna materia para ponerles mención de honor. Ordenar alfabéticamente por nombre asignatura.
* Conocer número de alumnos totales, los becados y porcentaje de becados respecto al total.
* Conocer nota media de los becados y el curso en el que están. Ordenar resultado alfabeticamente por nombre completo.
* Queremos repartir un bonus a los 10 profesores con mejores medias en las asignaturas que imparten.
* Obtener toda la información de asignaturas que contienen los caracteres 'datos' o 'progra' en su nombre. Ordenar por curso y luego por nombre.
* Obtener listado para enviar un comunicado oficial personalizado con el nombre a todas las personas de la universidad (alumnos y profesores). 