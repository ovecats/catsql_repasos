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

SELECT categoria, count(NIF)  as profesores 
FROM profesor 
GROUP BY categoria 
ORDER BY profesores DESC;

SELECT asignatura.curso AS curso, asignatura.nombre AS asignatura, asignatura.caracter AS caracter,
concat(profesor.nombre, ' ', profesor.apellido1, ' ', profesor.apellido2) AS coordinador, email 
FROM asignatura INNER JOIN profesor ON (profesor.idProfesor = asignatura.coordinador)
ORDER BY curso ASC, asignatura ASC;

SELECT concat(profesor.nombre, ' ', profesor.apellido1, ' ', profesor.apellido2) AS Profesor, count(impartir.idAsignatura) AS materiasImpartidas
 FROM profesor INNER JOIN impartir ON profesor.idProfesor = impartir.idProfesor 
 GROUP BY impartir.idProfesor
 ORDER BY materiasImpartidas DESC;
