# Installation du module

Depuis la version 0.9.1 du module, il est souhaitable de l'installer avec [Composer](https://getcomposer.org),
le système de paquet pour PHP. Si vous ne pouvez pas, ou si vous utilisez
lizmap 3.3 ou inférieur, passez à la section sur l'installation manuelle.

### Installation automatique avec Composer et lizmap 3.4 ou plus

* dans `lizmap/my-packages`, créer le fichier `composer.json` s'il n'existe pas
  déjà, en copiant le fichier `composer.json.dist`, qui s'y trouve.
* en ligne de commande, dans le répertoire `lizmap/my-packages/`, tapez :
  `composer require "lizmap/lizmap-adresse-module"`
* puis aller dans le répertoire `lizmap/install/` pour lancer l'installateur

Si vous utilisez Lizmap 3.6 ou plus, lancez d'abord la commande

```bash
php configurator.php adresse
```

Enfin lancez les scripts d'installation :

```bash
php installer.php
./clean_vartmp.sh
./set_rights.sh
```

### Installation manuelle dans lizmap 3.3 ou 3.4 sans Composer

* Récupérer le dossier `adresse` dans https://github.com/3liz/lizmap-adresse-module
* Dans le répertoire où est installé lizmap, le mettre dans le dossier `lizmap/lizmap-module/`
* Dans le fichier `localconfig.ini.php` qui se situe dans `lizmap/var/config` il y a la partie `[modules]` où
  il faut y rajouter le niveau d’accès du module :
  * `adresse.access = 2`
* lancer la commande : `php install/installer.php`
