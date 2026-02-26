# Ngrok install
Herramienta para crear un tunnel seguro entre la raspberry y el exterior, sin modificar configuraciones del router.

# Crear usuario
Crear Usuario en [ngrok.com](https://ngrok.com/) y obtener un Authtoken.

# Instalar ngrok
```
curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc > /dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
```

# añadir token
```
ngrok config add-authtoken TU_TOKEN_AQUI
```

# Levantar tunnel jenkins
Para el test este comando es suficiente, pero al cerrar se pierde el "tunnel"
```
ngrok http 8080
```

# Configuracion github

- Copia la URL de ngrok (la que termina en .app).

- Ve a tu repositorio en GitHub > Settings > Webhooks > Add webhook.

- Payload URL: Pega tu URL y añade /github-webhook/ al final.

- Ejemplo: https://a1b2-c3d4.ngrok-free.app/github-webhook/

- Content type: Selecciona application/json.

- Add webhook.

# Configurar Jenkins para recibir el aviso

- Dentro de Jenkins, en la configuración de tu proyecto (el que creamos antes):

- Ve a la sección Build Triggers.

- Marca: GitHub hook trigger for GITScm polling.

- Guarda.

# TEST
Hacer un cambio en el algun archivo para verificar la ejecucion en jenkins