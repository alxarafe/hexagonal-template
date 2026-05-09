# Plantilla Hexagonal Monorepo

[badges]

> 📚 Also available in english: README.md

Esta es una plantilla diseñada para aplicaciones basadas en arquitectura hexagonal estricta y modelado de dominio avanzado.

El repositorio proporciona una estructura reutilizable para implementar el mismo dominio en dos stacks independientes:

- PHP 8.x (Vanilla + Flight)
- Java 21 (Spring Boot adapters)

Este repositorio incluye una implementación de referencia basada en un dominio de ejemplo para demostrar:

- modelo conceptual compartido
- contratos API consistentes
- tests funcionales equivalentes
- reglas arquitectónicas comunes

---

## CAPAS DE ARQUITECTURA

Este proyecto distingue dos niveles de identidad:

### Capa conceptual (lo que ofrece el sistema)
- API PHP
- API Java
- Base de datos

### Capa de infraestructura (cómo está implementado)
- app_php
- app_java
- database

Ambas capas representan el mismo sistema desde distintos niveles de abstracción y no deben mezclarse en el diseño ni en la documentación.

---

## OBJETIVOS

- Arquitectura Hexagonal estricta
- DDD (Domain-Driven Design)
- TDD
- Contract Testing
- Enforcement arquitectónico automatizado
- Comparativa PHP vs Java sobre un mismo modelo de dominio

---

## ESTRUCTURA DEL REPOSITORIO

```text
/api-tests
/bin
/docker
/docs
/java
/php
/private