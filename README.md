# Inception
This project aims to broaden your knowledge of system administration by using Docker. You will virtualize several Docker images, creating them in your new personal virtual machine.

 ### To install and configure WordPress on your server, follow these steps:

    1- Install and configure a web server such as Apache or Nginx and a database server such as MySQL or MariaDB.

    2- Download the latest version of WordPress from https://wordpress.org/download/ and unzip the downloaded file.

    3- Create a new database and user for WordPress. You can do this using the MySQL or MariaDB command line, or a graphical tool such as PhpMyAdmin.

    4- Copy the WordPress files to the desired location on your server. This is usually the /var/www/html directory for Apache or /usr/share/nginx/html for Nginx.

    5- Open a web browser and go to http://your-server-ip/wp-admin/install.php. Replace your-server-ip with the IP address or domain name of your server.

    6- Follow the prompts to configure WordPress. This will include setting the site title, creating a username and password for the admin account, and selecting a language.

    7- Click the "Install WordPress" button to complete the installation.

After installation, you can log in to the WordPress admin dashboard by going to http://your-server-ip/wp-admin and entering your admin username and password. From there, you can customize your site, create and publish content, and install plugins to add additional features to your WordPress site.

#  PID 1 and the best practices for writing Dockerfiles : 
PID 1 is the process with process ID 1 in a Unix-like operating system. It is the first process that is started when the system boots and is typically the parent process of all other processes on the system

