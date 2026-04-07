# README

# 🖋️ Tattoo Artist Platform

Tattoo Artist Platform es una aplicación web que conecta tatuadores con personas que buscan tatuarse. La plataforma permite a los tatuadores mostrar su portafolio, compartir su estilo artístico y gestionar citas con clientes, mientras que los usuarios pueden descubrir artistas, explorar trabajos y encontrar al tatuador adecuado para su próximo tatuaje.

Este proyecto fue desarrollado como una aplicación de aprendizaje utilizando **Ruby on Rails**, **PostgreSQL** y **Docker**, con el objetivo de practicar arquitectura backend, modelado de bases de datos y desarrollo de aplicaciones web modernas.

---

# 🚀 Features

### 👤 Usuarios

* Registro e inicio de sesión
* Perfil personal con biografía y ubicación
* Seguir tatuadores favoritos
* Dar "likes" a portafolios
* Escribir reseñas después de una cita

### 🎨 Tatuadores

* Perfil profesional
* Información del estudio
* Redes sociales
* Ubicación

### 🖼️ Portafolios

* Galería de tatuajes
* Soporte para imágenes y videos (YouTube)
* Asociación con estilos de tatuaje

### 📅 Citas

* Solicitud de citas entre clientes y tatuadores
* Estado de citas (pendiente, confirmada, cancelada)
* Precio estimado y notas

### ⭐ Reviews

* Calificación de tatuadores
* Comentarios de clientes

---

# 🏗️ Arquitectura

La aplicación sigue el patrón **MVC (Model-View-Controller)** de Ruby on Rails.

Relaciones principales del sistema:

```
User
 ├── TattooArtist
 │     ├── Portfolios
 │     │      ├── PortfolioMedia
 │     │      └── Likes
 │     ├── Reviews
 │     └── Appointments
 │
 ├── Likes
 ├── Reviews
 └── Follows
```

---

# 🗄️ Database Schema

Principales entidades:

* Users
* TattooArtists
* Portfolios
* PortfolioMedia
* TattooStyles
* Appointments
* Reviews
* Likes
* Follows

El diseño de la base de datos fue realizado usando:

https://dbdiagram.io

Table users {
id bigint [pk]
name varchar
username varchar [unique]
email varchar [unique]
encrypted_password varchar
role varchar
bio text
avatar_url varchar
location varchar
created_at timestamp
updated_at timestamp
}

Table tattoo_artists {
id bigint [pk]
user_id bigint [unique]
studio_name varchar
bio text
location varchar
instagram varchar
website varchar
hourly_rate decimal
created_at timestamp
updated_at timestamp
}

Table portfolios {
id bigint [pk]
tattoo_artist_id bigint
title varchar
description text
created_at timestamp
updated_at timestamp
}

Table portfolio_media {
id bigint [pk]
portfolio_id bigint
media_type varchar
image_url varchar
youtube_url varchar
created_at timestamp
}

Table tattoo_styles {
id bigint [pk]
name varchar [unique]
}

Table portfolio_styles {
portfolio_id bigint
style_id bigint
}

Table appointments {
id bigint [pk]
client_id bigint
tattoo_artist_id bigint
start_time timestamp
end_time timestamp
status varchar
price decimal
notes text
created_at timestamp
updated_at timestamp
}

Table reviews {
id bigint [pk]
user_id bigint
tattoo_artist_id bigint
rating integer
comment text
created_at timestamp
}

Table likes {
id bigint [pk]
user_id bigint
portfolio_id bigint
created_at timestamp
}

Table follows {
id bigint [pk]
user_id bigint
tattoo_artist_id bigint
created_at timestamp
}

---

# 🛠️ Tech Stack

**Backend**

* Ruby
* Ruby on Rails

**Database**

* PostgreSQL

**Infrastructure**

* Docker
* Docker Compose

**Architecture**

* ActiveRecord ORM

---

# 📦 Installation

### 1️⃣ Clonar el repositorio

```
git clone https://github.com/yourusername/tattoo-platform.git
cd tattoo-platform
```

---

### 2️⃣ Construir los contenedores

```
docker compose build
```

---

### 3️⃣ Levantar la aplicación

```
docker compose up
```

---

### 4️⃣ Crear la base de datos

```
docker compose exec web rails db:create
docker compose exec web rails db:migrate
```

---

### 5️⃣ Abrir la aplicación

```
http://localhost:3000
```

---

# 🧪 Desarrollo

Para ejecutar comandos de Rails dentro del contenedor:

```
docker compose exec web bash
```

Ejemplos:

```
rails console
rails db:migrate
rails generate model
```

---

# 📅 Roadmap

Funciones futuras:

* 🔎 Búsqueda avanzada de tatuadores por estilo
* 📍 Geolocalización de estudios
* 💬 Sistema de mensajería entre cliente y tatuador
* 🖼️ Subida directa de imágenes
* 📱 Interfaz mobile-friendly
* 💳 Pagos para reservas de citas

---

# 🎯 Objetivo del proyecto

Este proyecto fue creado como una práctica para aprender:

* Diseño de bases de datos relacionales
* Arquitectura de aplicaciones Rails
* Desarrollo con Docker
* Gestión de modelos y relaciones complejas

También sirve como base para desarrollar una plataforma real de descubrimiento de tatuadores.

---

# 👨‍💻 Author

Davinson Castañeda
