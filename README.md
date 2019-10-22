# Table
A clone of Yelp's web platform for restaurant search. Built in Ruby on Rails. The goal is to add and find "local-only" options avilable in cities across the nation. This is working towards being a crowd-sourced platform.

### Live link

https://nativ-project.herokuapp.com/ (running on Heroku)

![Uploading Screen Shot 2019-10-22 at 1.58.01 PM.png…](https://user-images.githubusercontent.com/50840199/67320631-18555380-f4d4-11e9-8952-5d0ecf3eb8b5.png)

### Code walkthrough
The frontend of this application is running on Rails and Bootstrap. The backbone of the app is on the ```index.html``` folder -- The bread and butter of the user experience.

### How to use the app
The app starts the user off with a choice of what state and city users are looking to dine at. After choosing a city, the user is given a choice of "local-only" restaurant options, with additional information associated with each place.

Under development: Adding categories and options. Once local places appear on page rom search results, the user can select from a number of filters to find better matches.

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
