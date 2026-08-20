# TEC 532 - SFIC Campus Events

## Semana 3: Contenedores y CI/CD

Bienvenido al proyecto práctico de la Semana 3.

Durante esta sesión utilizaremos una aplicación HTML/CSS muy sencilla para seguir el recorrido de una aplicación desde el código hasta un entorno administrado con Kubernetes.

No necesitas experiencia previa desarrollando aplicaciones web.

## Nuestro recorrido

Código HTML/CSS → Dockerfile → Imagen Docker → Contenedor → GitHub Container Registry → Kubernetes → GitHub Actions → Nueva versión

## Archivos principales

- `index.html`: contenido de la aplicación.
- `styles.css`: presentación visual.
- `Dockerfile`: describe cómo construir la imagen.
- `k8s/deployment.yaml`: describe cómo Kubernetes ejecutará la aplicación.
- `k8s/service.yaml`: proporciona acceso estable a los Pods.
- `tests/smoke-test.sh`: comprueba automáticamente que la aplicación responde.
- `.github/workflows/ci-cd.yml`: define el pipeline de CI/CD.

## Importante

No necesitas instalar Docker o Kubernetes en tu computadora para las actividades del curso. Las prácticas se realizarán principalmente desde el navegador.

## Versión inicial

La aplicación comienza como **SFIC Campus Events - Versión 1.0**.

Durante la sesión realizaremos un cambio visible y observaremos cómo ese cambio pasa por nuestro pipeline.

## Objetivo

Al finalizar la práctica deberías poder explicar el recorrido:

**Código → Docker → Imagen → Registro → Kubernetes → CI/CD**

También deberías poder reconocer qué problema resuelve cada herramienta.
