# Inception

Une petite infrastructure Docker Compose montée de zéro pour le cursus 42 : NGINX en TLS, WordPress avec PHP-FPM et MariaDB, chacun dans son conteneur construit depuis Debian, sans image toute faite.

```sh
make        # construit les images et lance les services
make down   # arrête les services
make clean  # supprime aussi les images et les volumes
```

La configuration (identifiants, nom de domaine) se lit dans `srcs/.env`, à créer avant le lancement. Les données persistent dans `/home/gurodrig/data`, chemin fixé dans le `Makefile`.
