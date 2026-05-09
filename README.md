# Hexagonal Monorepo Template

![PHP Version](https://img.shields.io/badge/PHP-8.4+-blueviolet?style=flat-square)
![Java Version](https://img.shields.io/badge/Java-21+-orange?style=flat-square)
![PHP CI](https://github.com/alxarafe/hexagonal-template/actions/workflows/php.yml/badge.svg)
![Java CI](https://github.com/alxarafe/hexagonal-template/actions/workflows/java.yml/badge.svg)
[![Quality Report](https://img.shields.io/badge/quality-report-brightgreen?style=flat-square)](https://alxarafe.github.io/hexagonal-template/quality/)
![Static Analysis](https://img.shields.io/badge/static%20analysis-PHPStan%20%2B%20Deptrac-blue?style=flat-square)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/alxarafe/hexagonal-template/issues?utf8=✓&q=is%3Aopen%20is%3Aissue)

> 📚 También disponible en español: [README.es.md](README.es.md)

This is a template for building applications based on strict Hexagonal Architecture and advanced domain modeling.

The repository provides a reusable structure to implement the same domain across two independent stacks:

- PHP 8.x (Vanilla + Flight)
- Java 21 (Spring Boot adapters)

This repository includes a reference implementation based on an example domain to demonstrate:

- shared conceptual model
- consistent API contracts
- equivalent functional tests
- common architectural rules

---

## ARCHITECTURE LAYERS

This project distinguishes two identity layers:

### Conceptual layer (what the system provides)
- PHP API
- Java API
- Database

### Infrastructure layer (how it is implemented)
- app_php
- app_java
- database

Both layers represent the same system from different abstraction levels and must not be mixed in naming or documentation.

---

## OBJECTIVES

- Strict Hexagonal Architecture
- Domain-Driven Design (DDD)
- Test-Driven Development (TDD)
- Contract Testing
- Automated architectural enforcement
- PHP vs Java parity comparison on a shared domain

---

## REPOSITORY STRUCTURE

```text
/api-tests
/bin
/docker
/docs
/java
/php
/private