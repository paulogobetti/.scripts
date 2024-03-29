#!/usr/bin/env bash
#
# curl -s https://raw.githubusercontent.com/paulogobetti/scripts/main/laravel-docker-sail-custom-init.sh | bash
#
# # # #

docker info > /dev/null 2>&1

# Ensure that Docker is running...
if [ $? -ne 0 ]; then
    echo "Docker is not running."

    exit 1
fi

docker run --rm \
    --pull=always \
    -e PUID=1000 \
    -e PGID=1000 \
    -v "$(pwd)":/opt \
    -w /opt \
    laravelsail/php82-composer:latest \
    bash -c "laravel new opencommerce && cd opencommerce && php ./artisan sail:install --with=mysql,redis "

cd opencommerce

# Allow build with no additional services..
if [ "mysql redis" == "none" ]; then
    ./vendor/bin/sail build
else
    ./vendor/bin/sail pull mysql redis
    ./vendor/bin/sail build
fi

CYAN='\033[0;36m'
LIGHT_CYAN='\033[1;36m'
BOLD='\033[1m'
NC='\033[0m'

echo -e "${BOLD}Thank you! We hope you build something incredible. Dive in with:${NC} cd opencommerce && ./vendor/bin/sail up"

if sudo -n true 2>/dev/null; then
    sudo chown -R $USER: .
    echo -e "${BOLD}Get started with:${NC} cd opencommerce && ./vendor/bin/sail up"
else
    echo -e "${BOLD}Please provide your password so we can make some final adjustments to your application's permissions.${NC}"
    echo ""
    sudo chown -R $USER: .
    echo ""
    echo -e "${BOLD}Thank you! We hope you build something incredible. Dive in with:${NC} cd opencommerce && ./vendor/bin/sail up"
fi
