# World Cup Predictions

Predict the results of the 2018 FIFA World Cup ™ games and show your friends who is the best!

## About the Application

**World Cup Predictions** is a Web Application built using Ruby on Rails framework and Docker.

These are current features:
- Sign-in and Sign-up using email and password
- Predictions based on a configurable range of time
- Configurable score on different criteria
- Automatic setup of World Cup Round games
- Leagues
    - Creation
    - Invites
    - Leaderboard
    - Prediction sharing
    - Statistics per game

## Developing

In order to test and develop this application, you may use Docker and Docker Compose.

Running `docker-compose up`, 3 containers will start:

- Rails Web Server on port 3000
- MySQL Server on port 3306
- Mailcatcher on HTTP Port 1080 and SMTP Port 1025

## Configuration

Run on your terminal:
```bash
docker-compose run --rm app bin/setup
docker-compose run --rm app rails setup:world_cup_2018
```

If you want to collaborate or have a suggestion, feel free to open an issue or create a Pull Request!
