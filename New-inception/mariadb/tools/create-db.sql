
CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'mmasstou'@'%' IDENTIFIED BY 'mmasstou0123';
GRANT ALL PRIVILEGES ON wordpress.* TO 'mmasstou'@'%';
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY 'root0123';