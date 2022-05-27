# Spotr - A Local Fitness Finder

<img src="READMEBanner.png" alt="Banner"/>

## Developers
#### [Kate Remick](https://github.com/Kate-Remick), [Matt Elmore](https://github.com/dawabar), [Max Goduco](https://github.com/mgoduco), [Nick Gonzalez](https://github.com/gonzanick)

## Overview

Spotr is intended to be used by a customer to find different fitness facilities based on their location, desired activity, and general category of exercise. Facility owners are also able to utilize the application to advertise and have customers view and potentially join their gym or facility.

## Description

This full-stack web application utilizes a fully developed MySQL database schema connected to Java through JPA. Following C.R.U.D the app allows the manipulation of different entities in the database tables. Two different types of users with different permissions can log in and are authenticated through a MySQL table. The customer user has a log and can track different goals and journal entries with timestamps to track their fitness progress.

## Lessons Learned
- Utilize git branches and consistently merging to main branch to optimize team production

- Creating a schema table with a compound key caused more problems than it solved
- Java beans using Spring boot cannot pass objects to Controllers :(
- Using HTML and CSS to format and build a cleaner looking site

## Technologies Used
- Frontend
  - HTML/CSS
  - Bootstrap
  - Java Standard Tag Library (JSTL)
- Backend
  - Java
  - Spring MVC
  - MySQLWorkbench
  - MySQL
  - Gradle
  - Unix Terminal
  - Java Persistence API
  - Hibernate
- Collaboration
  - Git and Github
  - Zoom
  - Slack
- Research
  - Google
  - StackOverflow
  - Mozilla Developer Network
  - SD SQUAD

## EER Diagram
<img src="DB/fitnessfinderdb.png" alt="DB Schema"/>
