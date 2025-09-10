# Infraestructura - Guía de Despliegue

Este repositorio contiene la configuración de infraestructura para el despliegue de aplicaciones.

## Prerrequisitos

Antes de comenzar, asegúrate de tener instalado:

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [Docker](https://docs.docker.com/get-docker/) >= 20.10
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (para despliegues en Kubernetes)
- AWS CLI configurado (si usas AWS)

## Estructura del Proyecto

```
.
├── terraform/          # Configuración de Terraform
├── docker/             # Archivos Docker y docker-compose
├── kubernetes/         # Manifiestos de Kubernetes
├── scripts/            # Scripts de automatización
└── README.md           # Este archivo
```

## Comandos de Despliegue

### 1. Despliegue con Terraform

#### Inicializar Terraform
```bash
cd terraform/
terraform init
```

#### Planificar cambios
```bash
terraform plan
```

#### Aplicar infraestructura
```bash
terraform apply
```

#### Destruir infraestructura
```bash
terraform destroy
```

### 2. Despliegue con Docker

#### Construir imagen
```bash
docker build -t mi-app .
```

#### Ejecutar contenedor
```bash
docker run -d -p 8080:8080 mi-app
```

#### Usando Docker Compose
```bash
# Levantar servicios
docker-compose up -d

# Ver logs
docker-compose logs

# Detener servicios
docker-compose down
```

### 3. Despliegue en Kubernetes

#### Aplicar manifiestos
```bash
kubectl apply -f kubernetes/
```

#### Ver estado de pods
```bash
kubectl get pods
```

#### Ver servicios
```bash
kubectl get services
```

#### Eliminar recursos
```bash
kubectl delete -f kubernetes/
```

### 4. Scripts de Automatización

#### Despliegue completo
```bash
./scripts/deploy.sh
```

#### Limpieza de recursos
```bash
./scripts/cleanup.sh
```

## Variables de Entorno

Crea un archivo `.env` con las siguientes variables:

```env
# AWS Configuration
AWS_REGION=us-east-1
AWS_ACCESS_KEY_ID=tu_access_key
AWS_SECRET_ACCESS_KEY=tu_secret_key

# Application Settings
APP_ENV=production
DATABASE_URL=postgresql://user:pass@localhost:5432/db
```

## Monitoreo

### Ver logs de aplicación
```bash
# Docker
docker logs <container_id>

# Kubernetes
kubectl logs <pod_name>
```

### Estado de salud
```bash
# Verificar endpoint de salud
curl http://localhost:8080/health
```

## Solución de Problemas

### Verificar conectividad
```bash
# Ping a servicios
ping <service_url>

# Verificar puertos
netstat -tulpn | grep :8080
```

### Reiniciar servicios
```bash
# Docker
docker restart <container_id>

# Kubernetes
kubectl rollout restart deployment/<deployment_name>
```

## Contribución

1. Clona el repositorio
2. Crea una rama para tu funcionalidad
3. Realiza tus cambios
4. Ejecuta pruebas
5. Envía un pull request

## Soporte

Para problemas o preguntas, abre un issue en este repositorio.