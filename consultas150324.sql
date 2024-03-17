use facultad;
SELECT curso, nombre, caracter, count(nota) AS 'Alumnos', round(min(nota), 2) AS 'Nota min', round(max(nota), 2) AS 'Nota max', round(avg(nota), 2) AS 'Nota Media' 
FROM asignatura, matricula 
WHERE matricula.idAsignatura = asignatura.idAsignatura 
GROUP BY asignatura.nombre 
ORDER BY asignatura.curso ASC, asignatura.nombre ASC;


SELECT curso, nombre, round(avg(nota),2) AS 'Nota Media'
FROM asignatura, matricula
WHERE matricula.idAsignatura = asignatura.idAsignatura 
GROUP BY asignatura.nombre
HAVING avg(nota) < 5.00
ORDER BY curso ASC, nombre ASC;