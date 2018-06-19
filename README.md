# A local Laravel development stack

A package containing the required Docker images for running a portable Laravel installation.

The stack contains the following software:

- PHP (FPM) 7.2
- Nginx 1.10

Volumes are mounted to `./storage`.

### Start the stack

Open a terminal and execute the following command in order to start the stack:

`docker-compose up -d`

### Stop the stack

In order to stop the stack execute the following command:

`docker-compose down`

### Rebuild the images

Use:

`docker-compose up --build -d`

In order to rebuild the docker images required for this stack.

### Mount your Laravel directory

Use the following command in order to make a symbolic link of any folder inside the container:

`ln -s /path/to/your/laravel/install ./storage/www`

You should now be able to see your Laravel installation available at:

http://localhost

### Configuration variables used in your project

If you need access from a container to another instead of using the internal IP addresses of the
containers, you can instead use their hostnames:

- app (for the php-fpm container)
- web (for the nginx container)
- db (for the mysql container)
- pma (for the phpmyadmin container)

### Bug reports - features

Please [open an issue](https://github.com/klipitkas/laravel-docker/issues).
