# Usamos la versión Long Term Support basada en Debian (mejor para ARM/Raspberry)
FROM jenkins/jenkins:lts-jdk17

# Cambiamos a root para instalar paquetes del sistema
USER root

# Actualizamos e instalamos dependencias para Docker
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Añadimos la clave GPG oficial de Docker y el repositorio
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Instalamos el cliente de Docker (solo el CLI, no el daemon completo)
RUN apt-get update && apt-get install -y docker-ce-cli

# Volvemos al usuario jenkins por seguridad
USER jenkins

# Instalamos plugins básicos automáticamente para ahorrar tiempo
RUN jenkins-plugin-cli --plugins "blueocean docker-workflow"