# A local Laravel development stack

A repository containing the required 🐳 Docker images for running a portable
Laravel installation.

Laravel + Docker = ❤️

The repository contains the following software:

- php **7.3** + nginx **1.16.1** (alpine)
- supervisord **4.1.0** (alpine)
- mariadb **10.4** (bionic)
- adminer **4**
- redis **5** (alpine)

Volumes are mounted on directory:

- **./storage**

### Start the stack

Open a terminal and execute the following command in order to start the stack:

```
$ docker-compose up -d
```

### Stop the stack

In order to stop the stack execute the following command:

```
$ docker-compose down
```

### Rebuild the images

Use:

```
$ docker-compose up --build -d
```

or:

```
$ docker-compose build
```

### Check the results

Add the laravel files in the mounted directory and then visit:

- http://localhost

### Configuration variables used in your project

If you need access from a container to another instead of using the internal
IP addresses of the containers, you can instead use their hostnames:

- app (for the php-fpm/nginx container)
- database (for the mariadb container)
- adminer (for the adminer container)
- queue (for the redis container)

### Bug reports - features

For 🐞 reports please [open an issue](https://github.com/klipitkas/laravel-docker/issues).
