# API Testing con Postman

## 📌 API utilizada
**JSONPlaceholder** - https://jsonplaceholder.typicode.com/
API falsa gratuita y confiable para pruebas de endpoints REST.

## 🎯 Endpoints probados

| Método | Endpoint | Descripción | Estado |
|--------|----------|-------------|--------|
| GET | `/posts/1` | Obtener un post específico | ✅ PASS |
| POST | `/posts` | Crear un nuevo post | ✅ PASS |
| PUT | `/posts/1` | Actualizar un post existente | ✅ PASS |
| DELETE | `/posts/1` | Eliminar un post | ✅ PASS |

## 🧪 Tests automatizados en Postman

Cada request incluye tests en JavaScript que validan:

- Códigos de estado HTTP (200, 201)
- Estructura de la respuesta
- Datos específicos (títulos, IDs)
- Que la operación fue exitosa

### Ejemplo de test para GET

javascript
GET:

pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

pm.test("Response has post data", function () {
    var jsonData = pm.response.json();
    pm.expect(jsonData).to.have.property('id', 1);
    pm.expect(jsonData).to.have.property('title');
});

POST:

pm.test("Status code is 201", function () {
    pm.response.to.have.status(201);
});

pm.test("Post fue creado y tiene ID", function () {
    var jsonData = pm.response.json();
    pm.expect(jsonData).to.have.property('id');
    pm.expect(jsonData.id).to.not.be.null;
});


## 📦 Cómo importar esta colección

1. Abre Postman
2. Click en **Import** → **Upload Files**
3. Selecciona `Mi-Portfolio-QA-API-Tests.postman_collection.json`
4. Ejecuta cada request y verifica los tests en verde

## ✅ Resultados de las pruebas

| Request | Status Code | Tests |
|---------|-------------|-------|
| GET - Obtener post | 200 OK | ✅ 2/2 |
| POST - Crear post | 201 Created | ✅ 2/2 |
| PUT - Actualizar post | 200 OK | ✅ 3/3 |
| DELETE - Eliminar post | 200 OK | ✅ 2/2 |

## 🛠️ Habilidades demostradas

- Creación de requests HTTP (GET, POST, PUT, DELETE)
- Escritura de tests automatizados en JavaScript
- Validación de códigos de estado
- Validación de estructura y contenido de respuestas
- Exportación e importación de colecciones