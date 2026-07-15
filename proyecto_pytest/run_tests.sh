#! /bin/bash

echo "Iniciando ejecución de pruebas en Jenkins..."

# Verificar si el entorno virtual existe
if [ ! -d "venv" ]; then
  echo "Entorno virtual no encontrado. Creándolo..."
  python3 -m venv venv
fi

# Activar el entorno virtual correctamente
if [ -f "venv/bin/activate" ]; then
  source venv/bin/activate
elif [ -f "venv/Scripts/activate" ]; then # Para entornos Windows
  source venv/Scripts/activate
else
  echo "Error: No se pudo activar el entorno virtual."
  exit 1
fi

# Verificar si pip está instalado correctamente
echo "Instalando dependencias..."
pip install --upgrade pip --break-system-packages
pip install -r requirements.txt --break-system-packages

# Ejecutar las pruebas
echo "Ejecutando pruebas con pytest..."
venv/bin/python3 -m pytest tests/ --junitxml=reports/test-results.xml --html=reports/test-results.html --self-contained-html

echo "Pruebas finalidadas. Resultados en reports/"