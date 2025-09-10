# Infraestructura

Proyecto de infraestructura para despliegue y configuración de servicios.

## Requisitos Previos

- Docker y Docker Compose
- Git
- Acceso a los servicios de nube configurados

## Comandos de Despliegue

### Clonar el Repositorio
```bash
git clone https://github.com/jeancdevx/03-infraestructura.git
cd 03-infraestructura
```

### Construcción
```bash
# Construir las imágenes
docker-compose build

# Construir sin caché
docker-compose build --no-cache
```

### Despliegue Local
```bash
# Iniciar servicios
docker-compose up -d

# Ver logs
docker-compose logs -f

# Parar servicios
docker-compose down
```

### Despliegue en Producción
```bash
# Variables de entorno
export ENVIRONMENT=production

# Desplegar
docker-compose -f docker-compose.prod.yml up -d

# Verificar estado
docker-compose ps
```

### Comandos de Mantenimiento
```bash
# Reiniciar servicios
docker-compose restart

# Limpiar volúmenes
docker-compose down -v

# Actualizar servicios
git pull origin main
docker-compose pull
docker-compose up -d
```

## Estructura del Proyecto

```
03-infraestructura/
├── docker-compose.yml          # Configuración local
├── docker-compose.prod.yml     # Configuración producción
├── scripts/                    # Scripts de despliegue
└── config/                     # Archivos de configuración
```

## Notas

- Verificar que todos los servicios estén funcionando antes del despliegue
- Realizar backup de datos antes de actualizaciones
- Monitorear logs durante el despliegue