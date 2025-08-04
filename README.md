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
