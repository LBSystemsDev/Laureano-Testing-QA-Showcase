# API Testing con Postman

## 📌 API utilizada
**ReqRes** - https://reqres.in/
API falsa para pruebas de endpoints REST.

## 🎯 Endpoints probados

| Método | Endpoint | Descripción | Estado |
|--------|----------|-------------|--------|
| GET | `/api/users/2` | Obtener usuario específico | ✅ PASS |
| GET | `/api/users?page=2` | Listar usuarios paginados | ✅ PASS |
| POST | `/api/users` | Crear nuevo usuario | ✅ PASS |
| PUT | `/api/users/2` | Actualizar usuario | ✅ PASS |
| DELETE | `/api/users/2` | Eliminar usuario | ✅ PASS |
| POST | `/api/login` | Login exitoso | ✅ PASS |
| POST | `/api/login` | Login fallido | ✅ PASS |

## 🧪 Tests automatizados en Postman

Cada request incluye tests en JavaScript:

```javascript
// Ejemplo de test para GET /users/2
pm.test("Status code is 200", function () {
    pm.response.to.have.status(200);
});

pm.test("Response has user data", function () {
    var jsonData = pm.response.json();
    pm.expect(jsonData.data).to.have.property('id');
    pm.expect(jsonData.data).to.have.property('email');
});

pm.test("Response time < 500ms", function () {
    pm.expect(pm.response.responseTime).to.be.below(500);
});