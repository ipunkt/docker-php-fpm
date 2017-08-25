# docker-php-fpm
PHP FPM based on the official php docker images for versions not supported there, currently 5.3

# Usage
## Docker
docker run -d --name fpm53 ipunktbs/php-fpm:53-1.1.7
docker run -d --name actual-container --volumes-from fpm53 actual\_container
-> Use `/var/run/php/php-fpm.sock` to connect to fpm

## Rancher
Start this container as a sidekick of your webserver.
On the main container go to volumes and tick `volume_from` for the fpm sidekick
Configure it to use `var/run/php/php-fpm.sock` to connect to fpm.

## Rancherize
Set `php` in the WebserverBlueprint to `5.3`
