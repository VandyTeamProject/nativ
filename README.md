# Nativ
A clone of Yelp's web platform for restaurant search. Built in Ruby on Rails. The goal is to add and find "local-only" options available in cities across the nation. This is working towards being a crowd-sourced platform.

Keep a record of all of your favorite places you like to "nom nom nom".

Here's a Yelp Clone that features user authentication, Google map API integration, dashboards, automated emails, user comments, address geolocation, validations, and homepage sliders all wrapped in a mobile first designed web application.

## Features 

* Google Maps API
* User authentication
* User comments & ratings
* Image uploading hosted on AWS
* User dashboards with statistics on contributions
* Seach by State > City
* Favorite/Unfavorite places

### Live link

https://nativ-project.herokuapp.com/ (running on Heroku)

![Uploading Screen Shot 2019-10-22 at 1.58.01 PM.png…](https://user-images.githubusercontent.com/50840199/67320631-18555380-f4d4-11e9-8952-5d0ecf3eb8b5.png)

### Code walkthrough
The frontend of this application is running on Rails and Bootstrap. The backbone of the app is on the ```index.html``` folder -- The bread and butter of the user experience.

### Using the app
The app starts the user off with a choice of what state and city users are looking to dine at. After choosing a city, the user is given a choice of "local-only" restaurant options, with additional information associated with each place.

## Create and find
1. Sign up and log in with a personal account.
2. Click **+New Place**
3. Complete the form to add a new place.
4. Click **My Profile** to view places you've added.

## Search and Engage

1. Search by State > City to view places added to specific locations.
2. Click a place and add a review or comment.

### Core technologies
- Rails v4.2.4

#### Gems, packages, etc.
- ```gem 'simple_form'``` - form for creating places
- ```gem 'figaro'``` - safe handling of app credentials
- ```gem 'carrierwave', '>= 2.0.0.rc', '< 3.0'```
- ```gem 'omniauth-facebook'``` - oauth for Facebook
- ```gem 'omniauth-google-oauth2'``` - oauth2 for google
- ```gem 'carrierwave-aws'``` - file uploads and model associations
- ```gem "fog-aws"``` - images storage
- ```gem "geocoder"``` - find places on Google Maps
