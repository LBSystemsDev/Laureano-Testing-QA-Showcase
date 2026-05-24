# Casos de prueba - Funcionalidad Login
**Aplicación:** SauceDemo (https://www.saucedemo.com/)  
**Fecha:** Diciembre 2025  
**Tester:** Laureano

---

## TC-01: Login exitoso con credenciales válidas

| Campo | Valor |
|-------|-------|
| **Prioridad** | 🔴 High |
| **Tipo** | Funcional - Positivo |

**Pasos:**
1. Navegar a https://www.saucedemo.com/
2. Ingresar usuario: `standard_user`
3. Ingresar contraseña: `secret_sauce`
4. Click en "Login"

**Resultado esperado:** ✅ Redirección a /inventory.html, título "Products"

**Resultado actual:** ✅ PASS

---

## TC-02: Usuario bloqueado

| Campo | Valor |
|-------|-------|
| **Prioridad** | 🟡 Medium |
| **Tipo** | Funcional - Negativo |

**Pasos:**
1. Usuario: `locked_out_user`
2. Contraseña: `secret_sauce`
3. Click Login

**Resultado esperado:** ❌ Mensaje: "Sorry, this user has been locked out"

**Resultado actual:** ✅ PASS

---

## TC-03: Contraseña incorrecta

| Campo | Valor |
|-------|-------|
| **Prioridad** | 🔴 High |
| **Tipo** | Seguridad |

**Pasos:**
1. Usuario: `standard_user`
2. Contraseña: `password123`
3. Click Login

**Resultado esperado:** ❌ Mensaje: "Username and password do not match"

**Resultado actual:** ✅ PASS

---

## TC-04: Campos vacíos

| Campo | Valor |
|-------|-------|
| **Prioridad** | 🟡 Medium |
| **Tipo** | Validación |

**Pasos:**
1. Usuario vacío
2. Contraseña vacía
3. Click Login

**Resultado esperado:** ❌ Mensaje: "Username is required"

**Resultado actual:** ✅ PASS