# Nextcloud Docker Deployment

This project deploys Nextcloud with:

- MariaDB
- Redis (memcache)
- OnlyOffice
- Auto configuration (`occ`) via `init_config.sh`
- Externalized `.env` file for secrets

## Usage

```bash
cp .env.example .env
docker compose up -d
```

The `init_config.sh` script configures Redis, OnlyOffice, trusted domains, cron, and default region/email settings automatically on first run.

## Volumes

- `nextcloud_data`: User files
- `nextcloud_config`: App config
- `db_data`: MariaDB storage

## Requirements

- Docker
- Docker Compose v2+

## Notes

- This setup assumes you access Nextcloud at: `https://nextcloud.local`
- Update the values in `.env` accordingly.


## Auto Configuration Container

This project includes a temporary `configurator` container that connects to the Nextcloud instance and runs:
- `occ` commands to configure Redis, OnlyOffice, cron mode, trusted domains, etc.
- Sets recommended values like `overwrite.cli.url`, `default_phone_region`, and mail parameters

You can modify the `init_config.sh` file to adjust these defaults.

This container is launched automatically when you run `docker compose up`, and will only execute its configuration script once.
