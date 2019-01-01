# Cortex Installer

**Cortex Installer** is a command line tool that depends on composer to install the Cortex project seamlessly.

[![Packagist](https://img.shields.io/packagist/v/cortex/installer.svg?label=Packagist&style=flat-square)](https://packagist.org/packages/cortex/installer)
[![Scrutinizer Code Quality](https://img.shields.io/scrutinizer/g/rinvex/cortex-installer.svg?label=Scrutinizer&style=flat-square)](https://scrutinizer-ci.com/g/rinvex/cortex-installer/)
[![Code Climate](https://img.shields.io/codeclimate/github/rinvex/cortex-installer.svg?label=CodeClimate&style=flat-square)](https://codeclimate.com/github/rinvex/cortex-installer)
[![Travis](https://img.shields.io/travis/rinvex/cortex-installer.svg?label=TravisCI&style=flat-square)](https://travis-ci.org/rinvex/cortex-installer)
[![StyleCI](https://styleci.io/repos/90121903/shield)](https://styleci.io/repos/90121903)
[![License](https://img.shields.io/packagist/l/cortex/installer.svg?label=License&style=flat-square)](https://github.com/rinvex/cortex-installer/blob/develop/LICENSE)


# Installation

- [Installation](#installation)
    - [Server Requirements](#server-requirements)
    - [Installing Laravel](#installing-laravel)
    - [Configuration](#configuration)
- [Web Server Configuration](#web-server-configuration)
    - [Pretty URLs](#pretty-urls)

## Installation

### Server Requirements

The Cortex application has a few system requirements. Of course, all of these requirements are satisfied by the [Punnet](https://github.com/rinvex/punnet) docker environment, so it's highly recommended that you use Punnet as your local Cortex development environment.

However, if you are not using Punnet, you will need to make sure your server meets the following requirements:

- PHP >= 7.1.3
- OpenSSL PHP Extension
- PDO PHP Extension
- Mbstring PHP Extension
- Tokenizer PHP Extension
- XML PHP Extension
- Ctype PHP Extension
- JSON PHP Extension
- BCMath PHP Extension

### Installing Cortex

Cortex utilizes [Composer](https://getcomposer.org) to manage its dependencies. So, before using Laravel, make sure you have Composer installed on your machine.

#### Via Cortex Installer

First, download the Cortex installer using Composer:

```shell
composer global require cortex/installer
```

Make sure to place composer's system-wide vendor bin directory in your `$PATH` so the cortex executable can be located by your system. This directory exists in different locations based on your operating system; however, some common locations include:

- macOS: `$HOME/.composer/vendor/bin`
- GNU / Linux Distributions: `$HOME/.config/composer/vendor/bin`

Once installed, the `cortex new` command will create a fresh Cortex installation in the directory you specify. For instance, `cortex new blog` will create a directory named `blog` containing a fresh Cortex installation with all of Cortex's dependencies already installed:

```shell
cortex new blog
```

#### Via Composer Create-Project

Alternatively, you may also install Cortex by issuing the Composer `create-project` command in your terminal:

```shell
composer create-project --prefer-dist rinvex/cortex blog
```

#### Local Development Server

If you have PHP installed locally and you would like to use PHP's built-in development server to serve your application, you may use the `serve` Artisan command. This command will start a development server at `http://localhost:8000`:

```shell
php artisan serve
```

Of course, more robust local development options are available via [Punnet](https://github.com/rinvex/punnet).

### Configuration

#### Public Directory

After installing Cortex, you should configure your web server's document / web root to be the `public` directory. The `index.php` in this directory serves as the front controller for all HTTP requests entering your application.

#### Configuration Files

All of the configuration files for the Cortex application are stored in the `config` directory. Each option is documented, so feel free to look through the files and get familiar with the options available to you.

#### Directory Permissions

After installing Cortex, you may need to configure some permissions. Directories within the `storage` and the `bootstrap/cache` directories should be writable by your web server or Cortex will not run. If you are using the [Punnet](https://github.com/rinvex/punnet) docker environment, these permissions should already be set.

#### Application Key

The next thing you should do after installing Cortex is set your application key to a random string. If you installed Cortex via Composer or the Cortex installer, this key has already been set for you by the `php artisan key:generate` command.

Typically, this string should be 32 characters long. The key can be set in the `.env` environment file. If you have not renamed the `.env.example` file to `.env`, you should do that now. **If the application key is not set, your user sessions and other encrypted data will not be secure!**

#### Additional Configuration

Cortex needs almost no other configuration out of the box. You are free to get started developing! However, you may wish to review the `config/app.php` file and its documentation. It contains several options such as `timezone` and `locale` that you may wish to change according to your application.

You may also want to configure a few additional components of Cortex, such as:

- Cache
- Database
- Session

## Web Server Configuration

### Pretty URLs

#### Apache

Cortex includes a `public/.htaccess` file that is used to provide URLs without the `index.php` front controller in the path. Before serving Cortex with Apache, be sure to enable the `mod_rewrite` module so the `.htaccess` file will be honored by the server.

If the `.htaccess` file that ships with Cortex does not work with your Apache installation, try this alternative:

```shell
Options +FollowSymLinks -Indexes
RewriteEngine On

RewriteCond %{HTTP:Authorization} .
RewriteRule .* - [E=HTTP_AUTHORIZATION:%{HTTP:Authorization}]

RewriteCond %{REQUEST_FILENAME} !-d
RewriteCond %{REQUEST_FILENAME} !-f
RewriteRule ^ index.php [L]
```

#### Nginx

If you are using Nginx, the following directive in your site configuration will direct all requests to the `index.php` front controller:

```shell
location / {
    try_files $uri $uri/ /index.php?$query_string;
}
```

Of course, when using [Punnet](https://github.com/rinvex/punnet), pretty URLs will be automatically configured.


## Changelog

Refer to the [Changelog](CHANGELOG.md) for a full history of the project.


## Support

The following support channels are available at your fingertips:

- [Chat on Slack](http://chat.rinvex.com)
- [Help on Email](mailto:help@rinvex.com)
- [Follow on Twitter](https://twitter.com/rinvex)


## Contributing & Protocols

Thank you for considering contributing to this project! The contribution guide can be found in [CONTRIBUTING.md](CONTRIBUTING.md).

Bug reports, feature requests, and pull requests are very welcome.

- [Versioning](CONTRIBUTING.md#versioning)
- [Pull Requests](CONTRIBUTING.md#pull-requests)
- [Coding Standards](CONTRIBUTING.md#coding-standards)
- [Feature Requests](CONTRIBUTING.md#feature-requests)
- [Git Flow](CONTRIBUTING.md#git-flow)


## Security Vulnerabilities

If you discover a security vulnerability within this project, please send an e-mail to [security@rinvex.com](security@rinvex.com). All security vulnerabilities will be promptly addressed.


## About Rinvex

Rinvex is a software solutions startup, specialized in integrated enterprise solutions for SMEs established in Alexandria, Egypt since June 2016. We believe that our drive The Value, The Reach, and The Impact is what differentiates us and unleash the endless possibilities of our philosophy through the power of software. We like to call it Innovation At The Speed Of Life. That’s how we do our share of advancing humanity.


## License

This software is released under [The MIT License (MIT)](LICENSE).

(c) 2016-2019 Rinvex LLC, Some rights reserved.
