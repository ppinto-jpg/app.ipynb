# 1. Empezar desde una imagen oficial de Python
FROM python:3.10-slim

# 2. Instalar el software Graphviz (el ejecutable 'dot') en el sistema
# Esta es la línea que soluciona el problema
RUN apt-get update && apt-get install -y graphviz && \
    rm -rf /var/lib/apt/lists/*

# 3. Preparar el directorio de la app
WORKDIR /app

# 4. Copiar e instalar las librerías de Python
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 5. Copiar el resto de tu código (el notebook)
COPY . .

# 6. Definir el comando de inicio (reemplaza al Procfile)
# Escucha en todos los hosts (0.0.0.0) y en el puerto que Render asigne
CMD voila APP_SM_V3_Definitiva.ipynb --port=$PORT --ip=0.0.0.0 --no-browser --Voila.server_url=/
