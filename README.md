# Proyecto de Clase - Control de Personal Remoto
## Descripción
Este proyecto tiene como objetivo desarrollar una solución para controlar personal remoto, permitiendo la gestión de usuarios coordinadores y de soporte. La solución consta de una interfaz web para los coordinadores y una aplicación móvil para los usuarios de soporte.

## Características
- 1. Usuarios y Roles:
Dos tipos de usuario: Coordinador (UC) y Soporte (US).
2. Funcionalidades para Coordinadores (UC):
- Administrar usuarios de soporte (id, nombre, correo, clave).
- Administrar clientes (id, nombre).
- Evaluar los reportes de trabajo de los usuarios de soporte, calificando del 1 al 5.
3. Funcionalidades para Usuarios de Soporte (US):
- Enviar reportes de trabajo, describiendo el problema solucionado, el cliente atendido, la hora de inicio y la duración del trabajo.
- Trabajo offline: Capacidad de trabajar sin conexión y sincronizar los reportes una vez se tenga acceso a internet.
- Visualización de reportes enviados y su estado (enviado o pendiente), así como la calificación recibida (una vez disponible).

## Reportes
### Para Coordinadores (UC):
1. Soportes Realizados a Clientes:
- Filtro por cliente y/o usuario de soporte, mostrando fecha, usuario de soporte y evaluación.
2. Listado de Usuarios de Soporte (US):
- Con número de reportes y calificación promedio.

## Tecnologías Utilizadas
- Flutter: Para el desarrollo de la aplicación móvil y la interfaz web.
- Retool: Para el soporte del backend.

Este proyecto es parte de una actividad de clase y está sujeto a cambios y mejoras.
