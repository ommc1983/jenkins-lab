# Instalacion Docker en Rasberry pi.
## Docker
- install docker
`curl -sSL https://get.docker.com | sh`

- Agregar mi usuario
```
sudo usermod -aG docker $USER
newgrp docker
```

- Instalar docker compose
```
sudo apt update
sudo apt install -y docker-compose-plugin
```

- validar docker compose
```docker compose version```

test
docker run hello-world

evitar logs
sudo touch /etc/docker/daemon.json
sudo nano /etc/docker/daemon.json 

agregar los siguiente 
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}

guardar y ejecutar
sudo systemctl restart docker

imagen desde archivo dockerfile
docker build -t jenkins-lab .

revisar imagenes
docker images

lazar docker
```
sudo docker run -d \
  --name jenkins-lab \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins_home:/var/lib/jenkins \
  -v /var/run/docker.sock:/var/run/docker.sock \
  --restart=unless-stopped \
  jenkins-lab
```

docker ps para validar imagen corriendo

ver clave inicial docker logs jenkins-lab
es algo como a1bcd1....

[LF]> Jenkins initial setup is required. An admin user has been created and a password generated.
[LF]> Please use the following password to proceed to installation:
[LF]> 
[LF]> 045db419a45b475597b2958df39aff63
[LF]> 
[LF]> This may also be found at: /var/jenkins_home/secrets/initialAdminPassword

acceder ip:8080
usar la clave anteriormente encontrada e instalar los plugins seguridos.

Crear tu usuario max/max
