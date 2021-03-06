# Changelog
All notable changes to this project will be documented in this file.
The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## 1.0.14 - 2018-07-07

### Security
- Updated dependencies

---

## 1.0.13 - 2018-07-03

### Added
- Added league summary show to unauthenticated users or not members.

---

## 1.0.12 - 2018-06-30

### Added
- Added Penalties on Todays Games.

---

## 1.0.11 - 2018-06-28

### Added
- Instructions to Score and Penalties on Predictions Central.

### Removed
- Penalties on empty games.

---

## 1.0.10 - 2018-06-26

### Fixed
- Draw input on group games was fixed.

---
## 1.0.9 - 2018-06-25

### Added
- Penalty input on knockout games
- Admin management team selection on knockout games

### Changed
- Improved autosave animation
- Today Games layout to complain penalties

---
## 1.0.8 - 2018-06-23

### Added
- Today Games panel on Home Screen
- Predictions on Today Games after corresponding match closing

---
## 1.0.7 - 2018-06-21

### Added
- Leaderboard history on leagues

---
## 1.0.6 - 2018-06-18

### Changed
- Improved feedback on prediction autosave

---
## 1.0.5 - 2018-06-16

### Added
- Rulings page

### Removed
- Save button on Prediction central

---
## 1.0.4 - 2018-06-16

### Added
- Current predictions are autosave on input

### Changed
- Ordering leaderboard on leagues by name as second criteria

### Removed
- Leaderboard history on leagues

---
## 1.0.3 - 2018-06-14

### Fixed

- Removed -1 score on closed unfinished matches
- Home page match widget redirect to calendar

---
## 1.0.2 - 2018-06-14

### Changed
- Redesigned matches screen
- Ordered matches by game time instead code

### Removed
- Performance on league details

### Fixed
- Moved .keep file to docker/volume folder

---
## 1.0.1 - 2018-06-12

### Added
- Mobile Behavior
- iOS and Android Home Screen icons
- JSON Application Manifest

### Changed
- PostgreSQL volume path on host changed from `./tmp/postgres` to `./docker/volumes/postgres`
---
## 1.0.0 - 2018-06-08

### Added
- Initial Release
- Authentication
  - Sign-in and Sign-up using Clearance
  - Password Recovery and Email Confirmation
- Admin Area
  - Manage Game Results
  - Configure prediction timing and score
- Public Area
  - Main Page
    - Summary with main information and useful links
    - Daily scores chart
  - Prediction Central
    - Predict open games (configurable on Admin Area)
    - Notify games close to be unavailable
  - Prediction History
    - Show all predictions
    - Show Game score (after finalized)
    - Show Prediction Score and Criteria
  - Leagues
    - Challenge another users and share results with them
    - Index page with all available leagues
    - Page to create a League
    - League management page available only for creator
      - Edit League name and Description
      - Invite another users or even not members
        - Invites are sent by e-mail and users can login or sign-up if they are not logged in
      - Remove members
    - League details (available for all participants)
      - Leaderboard
      - Leaderboard history by day
      - All predictions of closed games
    - Tournament Games
      - List with all games and results
      - Game details with more information about the game itself and the teams

---
