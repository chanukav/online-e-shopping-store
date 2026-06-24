# Deployment Guide for Online E-Shopping Store

## Overview
This project has been updated to support modern deployment using **Docker** and **Maven**. You can now deploy this application to any cloud provider that supports Docker (e.g., Render, Railway, Fly.io) or traditional Tomcat servers.

## Changes Made
1.  **mavenized**: Added `pom.xml` to manage dependencies (MySQL, JSTL, Servlets) and build the application.
2.  **Containerized**: Added `Dockerfile` to build and run the application in a Tomcat container.
3.  **Environment Configuration**: Updated `DBConnect.java` to read database credentials from environment variables (`DB_URL`, `DB_USER`, `DB_PASSWORD`).

## Prerequisites
-   GitHub account.
-   Cloud Provider account (e.g., [Render](https://render.com/), [Railway](https://railway.app/)).
-   A MySQL Database hosted online (e.g., [Aiven](https://aiven.io/mysql), [PlanetScale](https://planetscale.com/) - though PlanetScale is Vitess, standard MySQL is safer).

## Deployment Steps (Recommended: Render)

1.  **Push Changes to GitHub**
    Ensure all new files (`Dockerfile`, `pom.xml`) and changes are committed and pushed to your repository.

2.  **Create a MySQL Database**
    -   If you don't have one, you can create a free MySQL database on **Railway** or **Aiven**.
    -   Note down the **Host**, **Port**, **Database Name**, **Username**, and **Password**.
    -   Construct the JDBC URL: `jdbc:mysql://<HOST>:<PORT>/<DATABASE_NAME>?characterEncoding=utf8`

3.  **Deploy Web Service on Render**
    -   Go to your Render Dashboard.
    -   Click **New +** -> **Web Service**.
    -   Connect your GitHub repository.
    -   Render will automatically detect the `Dockerfile`.
    -   **Environment Variables**: Scroll down to the "Environment Variables" section and add:
        -   `DB_URL`: Your JDBC URL (e.g., `jdbc:mysql://mysql-host.com:3306/gamudalk?characterEncoding=utf8`)
        -   `DB_USER`: Your database username.
        -   `DB_PASSWORD`: Your database password.
    -   Click **Create Web Service**.

4.  **Wait for Build**
    -   Render will build the Docker image (downloading Maven dependencies, compiling code, and packaging WAR).
    -   Once finished, it will deploy to Tomcat.

## Local Development (with Docker)
If you have Docker running locally:
```bash
docker build -t eshop .
docker run -p 8080:8080 -e DB_URL="jdbc:mysql://host.docker.internal:3306/gamudalk" -e DB_USER="root" -e DB_PASSWORD="yourpassword" eshop
```
(Note: `host.docker.internal` allows the container to access your local MySQL).

<!-- docker run -d -p 8080:8080 -e DB_URL="jdbc:mysql://host.docker.internal:3306/gamudalk" -e DB_USER="root" -e DB_PASSWORD="yourpassword" --name eshop-container eshop -->



