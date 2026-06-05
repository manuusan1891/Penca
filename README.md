# 🏆 Penca de la Copa Mundial de la FIFA 2026

Este proyecto consiste en el desarrollo de una plataforma web y un motor de cálculo relacional para la gestión de una **Penca (Prode / Quiniela)** deportiva orientada a la Fase de Grupos del Mundial 2026 (con el nuevo formato de 48 equipos y 72 partidos). 

El sistema fue diseñado con un enfoque modular, eliminando la fricción de un login tradicional mediante una identificación directa por nombre y correo electrónico al momento de guardar los pronósticos.

---

## 🛠️ Tecnologías y Arquitectura

El ecosistema del proyecto está compuesto por tres capas integradas:

* **Capa de Presentación y Servidor (Backend):** Desarrollada en **Python con Flask** junto con **Bootstrap 5** para una interfaz web limpia, moderna y adaptada a dispositivos móviles.
* **Capa de Datos (Persistencia):** Base de datos relacional en **MySQL**, encargada de almacenar usuarios, partidos oficiales y las predicciones de forma estructurada.
* **Motor de Lógica y Puntos:** **Google Sheets**, que opera como el núcleo de cálculo mediante fórmulas lógicas condicionales (`SI`, `BUSCARV`, `SIGNO`) para procesar los puntajes automáticos (3 puntos por marcador exacto y 1 punto por tendencia de ganador/empate).

---

## 📁 Estructura del Repositorio

```text
penca-mundial/
│
├── database/
│   └── esquema_y_partidos.sql  # Script DDL de creación de tablas e inserción de los 72 partidos reales
│
├── google-sheets/
│   └── formula_puntos.txt      # Respaldo técnico de la fórmula lógica de asignación de puntajes
│
├── docs/
│   └── main.tex                # Código fuente del informe técnico académico en LaTeX
│
└── web-app/
    ├── app.py                  # Servidor backend en Flask y lógica de conexión a la base de datos
    └── templates/
        └── index.html          # Interfaz de usuario para la carga de pronósticos