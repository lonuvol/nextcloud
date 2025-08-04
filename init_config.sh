#!/bin/bash
set -e

if [ ! -f /app/www/src/occ ]; then
  echo "❌ No s'ha trobat /app/www/src/occ. Sortint..."
  exit 1
fi

echo "⏳ Esperant que Nextcloud estigui instal·lat i preparat..."
until php /app/www/src/occ status | grep -q "installed"; do
  echo "⌛ Nextcloud no està llest. Reintentant en 5s..."
  sleep 5
done

echo "✅ Nextcloud està preparat. Iniciant configuració..."
echo "⏳ Esperant que Nextcloud estigui instal·lat i preparat..."

until sudo -u abc php /app/www/src/occ status | grep -q "installed"; do
  echo "⌛ Nextcloud no està llest. Reintentant en 5s..."
  sleep 5
done

echo "✅ Nextcloud està preparat. Iniciant configuració..."

#!/bin/bash

# Esperem que Nextcloud estigui llest
until curl -k https://nextcloud_app/status.php &>/dev/null; do
  echo "Esperant Nextcloud..."
  sleep 5
done

# Configuració Redis
occ config:system:set memcache.local --value='\OC\Memcache\Redis' --type=string
occ config:system:set memcache.locking --value='\OC\Memcache\Redis' --type=string
occ config:system:set redis host --value='redis' --type=string
occ config:system:set redis port --value='6379' --type=integer

# Configuració OnlyOffice
occ config:system:set onlyoffice jwt_secret --value="${ONLYOFFICE_JWT_SECRET}" --type=string

# Trusted domains
occ config:system:set trusted_domains 0 --value="${TRUSTED_DOMAIN_0}" --type=string
occ config:system:set trusted_domains 1 --value="${TRUSTED_DOMAIN_1}" --type=string
occ config:system:set trusted_domains 2 --value="${TRUSTED_DOMAIN_2}" --type=string

# Configuració recomanada addicional
occ background:cron
occ db:add-missing-indices
occ maintenance:repair --include-expensive
occ config:system:set overwrite.cli.url --value="https://${TRUSTED_DOMAIN_2}"
occ config:system:set default_phone_region --value="${DEFAULT_PHONE_REGION}"
occ config:system:set mail_from_address --value="${MAIL_FROM_ADDRESS}"
occ config:system:set mail_domain --value="${MAIL_DOMAIN}"

echo "✔ Configuració completada"
