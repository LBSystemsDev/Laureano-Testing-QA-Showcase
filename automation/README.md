# Automatización de Pruebas con Selenium

## 🛠️ Tecnologías utilizadas

| Herramienta | Versión | Uso |
|-------------|---------|-----|
| Python | 3.x | Lenguaje de programación |
| Selenium | 4.x | Framework de automatización |
| WebDriver Manager | 5.x | Manejo automático de drivers |

## 🎯 Escenario automatizado

**Aplicación:** SauceDemo (https://www.saucedemo.com/)

**Flujo automatizado:**
1. Abrir el navegador
2. Navegar a https://www.saucedemo.com/
3. Ingresar usuario: standard_user
4. Ingresar contraseña: secret_sauce
5. Click en login
6. Validar que se muestra el título "Products"
7. Cerrar el navegador

## 📦 Instalación y ejecución

### 1. Instalar Python (si no lo tienes)
Descargar desde https://www.python.org/downloads/

### 2. Instalar dependencias

```bash
pip install selenium webdriver-manager
```

### 3. Ejecutar el script

```bash
python automation/login_automation.py
```

## ✅ Resultado esperado

```bash
🚀 Iniciando automatización...
✅ Página cargada
✅ Usuario ingresado
✅ Contraseña ingresada
✅ Click en login
✅ Login exitoso - Products visible
🔒 Navegador cerrado
```

## 🧠 Habilidades demostradas

- Automatización de navegador con Selenium
- Localización de elementos web (by ID, CSS Selector)
- Esperas implícitas y explícitas
- Validaciones automatizadas
- Buenas prácticas (setup/teardown)