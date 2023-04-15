[![Comprar](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/roxsross)

[![Discord](https://img.shields.io/discord/729672926432985098?style=social&label=Discord&logo=discord)](https://discord.gg/5fqHuBq6pf)
[![YouTube Channel Subscribers](https://img.shields.io/youtube/channel/subscribers/UCxPD7bsocoAMq8Dj18kmGyQ?style=social)](https://www.youtube.com/channel/UCa-FcaB75ZtqWd1YCWW6INQ?sub_confirmation=1)

# 295WithRoxs Academy DevOps @2023 Desafío Final 🔥 🔥
<p align="center"><img src="./assets/roxs.png" width="400"/></p>

### Concepto – ¿Pero qué es DevOps? 
DevOps es un término surgido de la combinación de “desarrollo” y “operaciones” (en inglés development y operations) que representa una cultura con el enfoque colaborativo entre el equipo de (Dev) desarrollo de software y el de (Ops) operación del software. 

En su significado más amplio, DevOps es una cultura. Lo que se quiere conseguir con este tipo de metodología es aumentar la comunicación y confianza entre los desarrolladores y los administradores de sistemas, es decir, integrar los departamentos de operaciones y desarrollo. Utilizamos metodologías ágiles y nos integramos en todas las etapas del ciclo de vida de la aplicación para entregar los productos lo más rápido posible y gestionar todas las incidencias que puedan surgir para hacer las correcciones pertinentes en cada situación. 

🔥 Con DevOps tu despliegue dejará de ser manual, repetitivo y propenso a errores y se volverá automatizado, rápido y seguro.

## **Introducción**:
El **desafío final** es surfear las olas en práctica y desafiar los conocimientos sobre las herramientas tecnológicas y conceptos teóricos aprendidos durante estos meses.
En las clases vimos: Intro DevOps, Git, Docker, Kubernetes, CI/CD, Jenkins, Github Actions, Cloud, Security, etc.

## **Objetivos**:
- Utilizar todo lo aprendido durante el bootcamp
- Proponer y llevar a cabo una solución general a la problemática
- Simular el caso real del ciclo de vida de una aplicación
- La automatización es la clave
- Crear y mantener entornos productivos y no productivos (develop, testing)
- Aprender a utilizar nuevas Tools
- Aprender a trabajar en equipo para resolver dudas o problemáticas

## **Requerimiento:**
La empresa **ZERO Technology**, solicita al Equipo de DevOps Trainer SuperPower 🚀 migrar alguno de sus dos proyectos:
Las opciones presentadas de los dos proyectos: 
- [final-bootcampdevops-ninja-v1](./final-bootcampdevops-ninja-v1/Readme.md)


Los proyectos estan formados por servicios (**frontend** y **backends**) el requerimiento apunta a desplegarlo en un cluster de Kubernetes. 

Apuntando a lograr administrar el ciclo de las aplicaciones dentro del cluster de forma transparente y que además se pueda automatizar el deploy desde el repositorio.

## **Arquitectura del Cluster:**
Dentro del cluster se proponen dos **entornos**: uno no productivo (**dev**) y uno productivo (**prod**). Cada entorno debe ser creado y administrado de forma independiente 

Los servicios se van a administrar a partir de manifiestos para desplegar las aplicaciones en kubernetes. 

- Pueden aprovisionar usando minikube ó k3s ó killercoda

<p align="center"><img src="./assets/minikube.jpeg" width="400"/></p>

> Si la opcion es usar EC2 
### Infra:
- Aprovisionar 2 servidores AWS EC2 con Terraform (server-dev, server-prd)
- Crear los ficheros de terraform + userdata (docker+docker-compose)

## **CICD**
Como plataforma para versionar el código e implementar el CI/CD pipeline se va a utilizar alguna de las siguientes opciones: 
- **Jenkins**
- **Github Actions**
- **Gitlab**

> Siguiendo la estrategia de branching por entornos.

## **CICD:**
Se debe configurar un CI/CD pipeline que implemente las siguientes stages básicos:
- Build de la imágen de Dockerfile
- Push de la imágen a DockerHub
- Controlar la version de la aplicacion
- Deploy de la aplicación en algunas de estas opciones:
    - Minikube
    - EC2 (docker-docker-compose)
    - EC2 + k3s

Luego agregar:
- Stage de aprobación manual antes del deploy cuando el entorno al que se va a deployar es producción
- Notificación del resultado del pipeline por Slack/Telegram

<p align="center"><img src="./assets/cicd.png" width="400"/></p>

## **Arquitectura:**
Realizar un diseño gráfico de las herramientas y servicios que utilizarían si implementaran esta solución en una Cloud (AWS, GCP, Azure, etcétera).

## **Observaciones y recomendaciones:**
- La arquitectura de la aplicación está formada por servicios backends y frontend los cuales deberían tener su propio repositorio.
- Se puede realizar un docker-compose para probar local la aplicación en su conjunto.
- Se puede deployar ingress para frontend, backend para poder utilizar una url configurada en */etc/hosts* ó usando wildcard DNS https://nip.io/ .
- Cada servicio debe tener su dockerfile.
- Documentación

## **Links:**
- [Install Minikube](https://k8s-docs.netlify.app/en/docs/tasks/tools/install-minikube/)
- [Install Postgresql](https://github.com/bitnami/charts/tree/master/bitnami/postgresql)

> Busca los logros donde no hay límites by @roxsross

<p align="center"><img src="./assets/devopsFinal.png" width="400"/></p>
<p align="center"><img src="./assets/devopsFinal1.png" width="400"/></p>

## Contribuciones

Como siempre, cualquier contribución es bienvenida, simplemente forkeá este repo y enviame una PR.  
