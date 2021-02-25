# Installation

* Récupérer le dossier `adresse` dans https://github.com/3liz/lizmap-adresse-module
* Dans le répertoire où est installé lizmap, le mettre dans le dossier `lizmap/lizmap-module/`
* Dans le fichier `localconfig.ini.php` qui se situe dans lizmap/var/config il y a la partie `[modules]`
  où il faut y rajouter le niveau d’accès du module : 
  * `adresse.access = 2`
* lancer la commande : `php install/installer.php`
