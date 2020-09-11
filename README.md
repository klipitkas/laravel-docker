# A local Laravel development stack

A repository containing the required 🐳 Docker images for running a portable
Laravel installation.

Laravel + Docker = ❤️

### STACK

- php **7.3** + nginx **1.16.1** (alpine)
- supervisord **4.1.0** (alpine)
- mariadb **10.4** (bionic)
- phpmyadmin
- redis **5** (alpine)
- mongodb **4.2.6**

### VOLUMES

We are now using named volumes, for the databases. To view the available volumes you can do:

```shell
$ docker volume ls
```

### START

Open a terminal and execute the following command in order to start the stack:

```shell
$ docker-compose up -d
```

### STOP

In order to stop the stack execute the following command:

```shell
$ docker-compose down
```

### REBUILD

Use:

```shell
$ docker-compose up --build -d
```

or:

```shell
$ docker-compose build
```

### DELETE THE VOLUMES

**WARNING**: This is a potentially catastrophic action and will delete any data
in those volumes:

```shell
$ docker-compose down -v
```

### DOES IT WORK

Add the Laravel files in the mounted directory and then visit:

- http://localhost

### FAQ

If you need access from a container to another instead of using the internal
IP addresses of the containers, you can instead use their hostnames:

- app (for the php-fpm/nginx container)
- database (for the mariadb container)
- pma (for the phpmyadmin container)
- queue (for the redis container)
- mongo (for the mongodb container)

### BUG REPORTS - FEATURE REQUESTS

For 🐞 reports please [open an issue](https://github.com/klipitkas/laravel-docker/issues).
