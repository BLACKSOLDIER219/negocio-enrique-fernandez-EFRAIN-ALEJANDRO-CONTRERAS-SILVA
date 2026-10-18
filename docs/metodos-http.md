# Métodos HTTP con JSONPlaceholder

Base URL: https://jsonplaceholder.typicode.com
Recurso utilizado: `/posts/1`

## GET
- URL: `https://jsonplaceholder.typicode.com/posts/1`
- Body: no requiere.
- Uso: recuperar y consultar una publicación.
- Respuesta habitual: `200 OK`.

## POST
- URL: `https://jsonplaceholder.typicode.com/posts`
- Body JSON:
  `{"title":"Prueba","body":"Publicación de ejemplo","userId":1}`
- Uso: enviar datos para crear una publicación.
- Respuesta habitual: `201 Created`.

## PUT
- URL: `https://jsonplaceholder.typicode.com/posts/1`
- Body JSON:
  `{"id":1,"title":"Título reemplazado","body":"Contenido reemplazado","userId":1}`
- Uso: enviar una representación completa del recurso.
- Respuesta habitual de la API: `200 OK`.

## PATCH
- URL: `https://jsonplaceholder.typicode.com/posts/1`
- Body JSON:
  `{"title":"Solo cambia el título"}`
- Uso: modificar parcialmente un recurso.
- Respuesta habitual: `200 OK`.

## DELETE
- URL: `https://jsonplaceholder.typicode.com/posts/1`
- Body: no requiere.
- Uso: solicitar la eliminación del recurso.
- Respuesta habitual: `200 OK`.

## Diferencia entre PUT y PATCH
PUT representa una sustitución completa del recurso; PATCH expresa una modificación parcial. En una API real, el comportamiento exacto depende de su implementación.

## Importante
JSONPlaceholder es una API de prueba. Simula las operaciones de escritura, pero los cambios no quedan guardados de forma permanente. Los códigos indicados son respuestas habituales; conviene comprobar el código recibido al ejecutar cada petición.
