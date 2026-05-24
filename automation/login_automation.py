"""
Script de automatización - Login en SauceDemo
Requisitos: pip install selenium webdriver-manager
"""

from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.chrome.service import Service
import time

# Configuración del driver
service = Service(ChromeDriverManager().install())
driver = webdriver.Chrome(service=service)

try:
    print("🚀 Iniciando automatización...")
    
    # 1. Navegar a la página
    driver.get("https://www.saucedemo.com/")
    print("✅ Página cargada")
    
    # 2. Ingresar usuario
    username = driver.find_element(By.ID, "user-name")
    username.send_keys("standard_user")
    print("✅ Usuario ingresado")
    
    # 3. Ingresar contraseña
    password = driver.find_element(By.ID, "password")
    password.send_keys("secret_sauce")
    print("✅ Contraseña ingresada")
    
    # 4. Click en login
    login_button = driver.find_element(By.ID, "login-button")
    login_button.click()
    print("✅ Click en login")
    
    # 5. Esperar y validar login exitoso
    wait = WebDriverWait(driver, 10)
    products_title = wait.until(
        EC.presence_of_element_located((By.CLASS_NAME, "title"))
    )
    
    # 6. Verificar el título
    if "Products" in products_title.text:
        print("✅ Login exitoso - Products visible")
    else:
        print("❌ Error: No se encontró la página de productos")
    
    # Pausa para ver el resultado (opcional)
    time.sleep(2)
    
except Exception as e:
    print(f"❌ Error durante la automatización: {e}")
    
finally:
    # Cerrar el navegador
    driver.quit()
    print("🔒 Navegador cerrado")