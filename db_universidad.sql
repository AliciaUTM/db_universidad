
-- Crear la base de datos
CREATE DATABASE db_universidad;

-- Crear tabla proyectos
CREATE TABLE proyectos (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    fecha_inicio DATE,
    estado VARCHAR(20)
);

-- Registros para la tabla proyectos
INSERT INTO proyectos (nombre, descripcion, fecha_inicio, estado) VALUES 
('Proyecto A', 'Desarrollo de una aplicación móvil', '2023-01-15', 'En curso'),
('Proyecto B', 'Implementación de un sistema de gestión de inventario', '2022-09-20', 'Completado'),
('Proyecto C', 'Diseño de una plataforma de e-learning', '2023-03-10', 'En curso'),
('Proyecto D', 'Investigación sobre inteligencia artificial', '2022-11-05', 'Pendiente'),
('Proyecto E', 'Creación de un sitio web corporativo', '2023-02-28', 'En curso'),
('Proyecto F', 'Desarrollo de un juego para dispositivos móviles', '2023-04-15', 'En curso'),
('Proyecto G', 'Implementación de un sistema de CRM', '2022-10-10', 'Completado'),
('Proyecto H', 'Diseño de una base de datos distribuida', '2023-01-05', 'En curso'),
('Proyecto I', 'Desarrollo de un sistema de gestión de proyectos', '2022-12-20', 'Pendiente'),
('Proyecto J', 'Investigación sobre nuevas tecnologías emergentes', '2023-03-30', 'En curso');

--Crear tabla tareas

CREATE TABLE tareas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion TEXT,
    fecha_limite DATE,
    estado VARCHAR(20)
);

-- Registros para la tabla tareas

INSERT INTO tareas (nombre, descripcion, fecha_limite, estado) VALUES 
('Tarea 1', 'Implementar la funcionalidad de inicio de sesión', '2023-01-31', 'En proceso'),
('Tarea 2', 'Diseñar la interfaz de usuario principal', '2023-02-10', 'Pendiente'),
('Tarea 3', 'Desarrollar el módulo de gestión de usuarios', '2023-03-05', 'Completada'),
('Tarea 4', 'Realizar pruebas de rendimiento y seguridad', '2023-02-28', 'En proceso'),
('Tarea 5', 'Actualizar la documentación del proyecto', '2023-03-15', 'Pendiente'),
('Tarea 6', 'Optimizar el rendimiento del servidor', '2023-02-20', 'Completada'),
('Tarea 7', 'Agregar funcionalidad de carrito de compras', '2023-04-05', 'En proceso'),
('Tarea 8', 'Realizar pruebas de integración con sistemas externos', '2023-03-25', 'Pendiente'),
('Tarea 9', 'Implementar el sistema de almacenamiento en la nube', '2023-04-10', 'En proceso'),
('Tarea 10', 'Actualizar la interfaz de usuario con comentarios de los usuarios', '2023-04-20', 'Pendiente');


select * from proyectos;

select * from tareas;


-- Consulta 1: Obtener el nombre, la descripción y el estado de todos los proyectos junto con el número de tareas asociadas a cada proyecto.
SELECT 
    p.nombre AS nombre_proyecto,
    p.descripcion AS descripcion_proyecto,
    p.estado AS estado_proyecto,
    COUNT(t.id) AS numero_tareas_asociadas
FROM proyectos p
LEFT JOIN tareas t ON p.id = t.id
GROUP BY p.id;

-- Consulta 2: Encontrar el nombre, la descripción y la fecha de inicio de los proyectos que tienen al menos una tarea pendiente.
SELECT 
    p.nombre AS nombre_proyecto,
    p.descripcion AS descripcion_proyecto,
    p.fecha_inicio AS fecha_inicio_proyecto
FROM proyectos p
INNER JOIN tareas t ON p.id = t.id
WHERE t.estado = 'Pendiente';

-- Consulta 3: Calcular el promedio de tareas completadas por proyecto.
SELECT 
    p.nombre AS nombre_proyecto,
    AVG(CASE WHEN t.estado = 'Completada' THEN 1 ELSE 0 END) AS promedio_tareas_completadas
FROM proyectos p
LEFT JOIN tareas t ON p.id = t.id
GROUP BY p.id;

