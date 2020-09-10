#! /bin/bash
# Git Hard Reset Fork
php -r "file_exists('.env') || copy('.env.example', '.env');"
composer install
php artisan key:generate
php artisan cache:clear
php artisan config:clear

echo "Configurez le fichier .env puis faites la commande : "
echo "php artisan migrate:fresh --seed"
