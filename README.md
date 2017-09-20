# docker-php-fpm
PHP FPM based on the official php docker images for versions not supported there, currently 5.3

# Configuration
- php memory limit: Set the environent variable PHP\_MEMORY\_LIMIT to your
  desired limit. leaving it empty will use 1024M as default
- php post limit: Set the environent variable PHP\_POST\_MAX\_SIZE to your
  desired limit. leaving it empty will use 8M as default
- php file upload size limit: Set the environent variable PHP\_UPLOAD\_MAX\_FILESIZE
  to your desired limit. leaving it empty will use 2M as default
- php default timezone: Set the environent variable DEFAULT\_TIMEZONE to your
  desired zone. Leaving it empty will use UTC as default

## Smtp
This image uses ssmtp for sending mails. The following environment variables can
be set to influence the ssmtp configuration file:

| Environment variable | ssmtp configuration file value | default value | Comment =|
|  --------------------  |  ------------------------------  |  -------------  | --------- |
| SMTP\_SERVER           | mailhub                          | smtp            |           |
| SMTP\_TLS              | UseTLS                           | NO              |           |
| SMTP\_START\_TLS       | UseSTARTTLS                      | NO              |           |
| SMTP\_AUTHENTICATION   | AuthMethod                       | ``              |           |
| SMTP\_USER             | AuthUser                         | smtp            | Only set if SMTP\_AUTHENTICATION is not empty |
| SMTP\_PASSWORD         | AuthPass                         | smtp            | Only set if SMTP\_AUTHENTICATION is not empty |
| FROM\_OVERRIDE         | FromLineOverride                 | YES             |           |

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
