-- Create the database used by the Spring Boot application.
-- Execute this script in MySQL before running the application.

CREATE DATABASE IF NOT EXISTS `demo`
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE `demo`;

-- Optional: create a dedicated user for the demo app
CREATE USER IF NOT EXISTS 'demo_user'@'%' IDENTIFIED BY 'demo_pass';
GRANT ALL PRIVILEGES ON `demo`.* TO 'demo_user'@'%';
FLUSH PRIVILEGES;
