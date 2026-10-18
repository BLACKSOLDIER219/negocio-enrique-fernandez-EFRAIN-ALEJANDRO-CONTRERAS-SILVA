# Proyecto WEB III: Negocio

## Datos del estudiante
- Nombres: EFRAIN ALEAJANDRO CONTRERAS SILVA
- Paralelo: 3
- CI: 13492206
- Fecha: 18/10/2026

## Descripción
Proyecto académico que integra Git y GitHub, consultas SQL, documentación de métodos HTTP y consumo de la API pública PokeAPI.

## Estructura
- `database/schema.sql`: creación de las tablas.
- `database/seed.sql`: datos de prueba.
- `database/consultas.sql`: siete consultas SQL.
- `docs/metodos-http.md`: documentación de GET, POST, PUT, PATCH y DELETE.
- `docs/conflicto-git.md`: registro del conflicto de Git.
- `frontend/index.html`: interfaz de la aplicación.
- `frontend/app.js`: consumo de PokeAPI.

## Base de datos
Se utiliza SQL con sintaxis compatible con PostgreSQL. Ejecutar primero `schema.sql`, luego `seed.sql` y finalmente las consultas de `consultas.sql`.

## Aplicación web
Abrir `frontend/index.html` en un navegador. La aplicación consulta PokeAPI y muestra información del Pokémon.

## Flujo de trabajo Git
Se utilizarán ramas `feature/<numero>-<descripcion>`, commits descriptivos y pull requests revisados antes de integrar los cambios a `main`. No se realizarán commits directamente en `main`.

## Conflicto controlado
Se documentará el conflicto de README provocado por cambios incompatibles en dos ramas, su resolución y la integración final.
