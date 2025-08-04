# 📦 Nextcloud Docker Stack

Aquest projecte desplega un servidor Nextcloud complet amb:

- ✅ Base de dades MariaDB
- ✅ Redis per millora de rendiment
- ✅ Integració amb OnlyOffice
- ✅ Configuració automàtica de Nextcloud (memòria cau, dominis, etc.)

## 🚀 Instruccions

### 1. Clona el repositori

```bash
git clone https://github.com/el-teu-usuari/nextcloud-docker.git
cd nextcloud-docker
```

### 2. Crea un fitxer `.env`

Copia l'exemple:

```bash
cp .env.example .env
```

Edita `.env` i omple les variables amb els teus valors (usuaris, contrasenyes, dominis, etc).

### 3. Inicia els serveis

```bash
docker compose up -d
```

### 4. Accedeix a Nextcloud

Un cop completada la instal·lació, obre el navegador a:

```
https://<ip-del-teu-servidor>:8080
```

## 📁 Volums persistents

- `nextcloud_config`: configuració i fitxers de Nextcloud
- `nextcloud_data`: dades d’usuaris
- `db_data`: base de dades MariaDB

## 🔁 Configuració automàtica

El contenidor `configurator` aplica automàticament:

- Dominis de confiança (`trusted_domains`)
- Configuració Redis (`memcache.local`)
- Clau OnlyOffice (`onlyoffice.jwt_secret`)
- Configuració regional (`default_phone_region`)
- Habilitació de cron automàtic

Aquest contenidor només s’executa una vegada i després es pot eliminar.

## 🔒 Recomanacions

- Usa un proxy invers (ex: Nginx o Traefik) per HTTPS real
- Configura còpies de seguretat dels volums
- Revisa els logs si alguna cosa no funciona:

```bash
docker logs nextcloud_app
docker logs nextcloud_configurator
```

---

**Fet amb ❤️ per tu mateix amb l'ajuda de ChatGPT**
