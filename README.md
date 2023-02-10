> # Inception

This project aims to virtualize several Docker images and create a network of containers for a WordPress website. The following containers are created:

* A Docker container with NGINX with TLSv1.2 or TLSv1.3 only [See More -&gt;](#nginx-container)
* A Docker container with WordPress + php-fpm
* A Docker container with MariaDB
* A volume that contains the WordPress database
* A second volume that contains the WordPress website files
* A docker-network that establishes the connection between the containers

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* Docker installed on your machine
* Familiarity with basic Docker concepts and commands

## Table of Contents

1. [Docker](#Docker)
1. [Volumes](#volumes)
1. [Docker Network](#docker-network)
1. [NGINX Container](#nginx-container)
1. [WordPress Container](#wordpress-container)
1. [MariaDB Container](#mariadb-container)











































































## Docker

> Docker is a software platform that allows you to create, deploy, and run applications inside containers. Containers are isolated environments that include all the necessary files and dependencies needed to run an application, making it easy to deploy and manage applications across different environments. Docker provides a standardized and reproducible way to package and distribute applications, making it easier for developers to create, test, and deploy their applications.

## NGINX Container

The NGINX container contains the NGINX web server with TLSv1.2 or TLSv1.3 only.

## WordPress Container

The WordPress container contains WordPress and php-fpm, installed and configured without NGINX.

## MariaDB Container

The MariaDB container contains the MariaDB database server, without NGINX.

## Volumes

There are two volumes in this project:

- A volume that contains the WordPress database
- A volume that contains the WordPress website files

## Docker Network

The Docker network in this project connects the containers.

For more information on how to build these containers, please refer to the [Code](#code) section.

## Code

To build the containers, follow the steps in the [Code](#code) section of this `README.md` file.
