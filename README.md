<!-- PROJECT LOGO -->
<br />
<p align="center">
  <a href="https://rocketlift.ca/assets/_rocket/R2-3c6296bf2343b849b947f8ccfce0de61dd34ba7f9e2a23a53d0a743bc4604e3c.png">
    <img src="https://rocketlift.ca/assets/_rocket/R2-3c6296bf2343b849b947f8ccfce0de61dd34ba7f9e2a23a53d0a743bc4604e3c.png" alt="Logo" width="500" height="200">
  </a>

  <h3 align="center">Rocket Elevators Information System
</h3>
  
  <p align="center">
    Odyssey Program - Weeks 4 & 5
  </p>
</p>



<!-- ABOUT THE PROJECT -->
## About The Project

Rocket Elevators Information System is the 4th and 5th project for the Odyssey 14 weeks program in CodeBoxx. 

By the 4th week We have created a CRUD website using a using Ruby on Rails with the website created in the Genesis Program. 

website used: [rocketlift.ca/](https://rocketlift.ca/)

We have also included a MySql Database that saves the quotations inserted in the quote form, and an Admin page.

##

For the 5th week, we have included a Data Warehouse with Postgres where has taken the subimitted quotes and contact forms info and through some queries
the Admin was able to analyse those data.

<br>

We have 7 API on the project

- **[Maps JavaScript API]**
- **[Twillo]**
- **[Zendesk]**
- **[Sengrid]**
- **[IBM Watson]**
- **[Dropbox]**
- **[Slack]**

If you want to test Dropbox, you have to create a customer (from backoffice) and a lead (from the index page) with the same phone number and email and go on the Admin_Stats page to trigger Dropbox.

If you want to test google maps, wait for it to finish loading, even if the browser isn't loading anymore.

If you want to test watson, press on the button to load him.

## Website deployed

* ### [rocketlift.ca/](https://rocketlift.ca/)

<br>

## Installation

Clone or download the .zip for this project. 

Here are the commands that will have to be entered in your terminal to start the server:
- mySQL server start
- ruby -v (To check if a corresponding version need to be installed)
- rails -v (To check if a corresponding version need to be installed)
- bundle install (To install all the necessary Gems)
- Check in the directory for config/database.yml and if necessary replace the database password by yours.
- rails db:create
- rails s

<br>

Here are the commands that will have to be entered in your terminal when modifications are made in the database:
- Ctrl + C (to stop the server)
- rails db:migrate reset
- rails db:seed

<br>

## Accessing

By clicking on “Login”, users will be redirected to a page and be asked to provide an email address and password.
	
	Example: 

	Email: nicolas.genest@codeboxx.biz
	Password: password

Forms are accessible to all users (with or without accounts). Once a “Contact Us” part for home page or Quote form in request a quote page is filled and submitted, data is generated in the back-end.

<br>

To access the database, use Dbeaver or MySQLWorkbench, which shows a history of data stored in the server. The fictitious and real data covers the last 3 years of activity from companies. Graphical representations and charts will also be available in the stats page of the website. 

<br>


## Consolidation week

The site used for consolidation week is : http://rocketelevatorsproject.me/

The API end points added in the consolidation week can be found here. 

https://github.com/LukaTrudel/Rocket_Elevators_REST_API


## Built With

* [Ruby V-2.6.6](https://www.ruby-lang.org/en/)
* [Rails V-5.2.6](https://guides.rubyonrails.org/)
* [MySql V-5.7](https://dev.mysql.com/)
* [Bootstrap](https://getbootstrap.com)
* [JQuery](https://jquery.com)
* [Postgres V-10.18](https://www.postgresql.org/docs/10/release-10-18.html)


<br>

<!-- TEAM MWMBERS -->
## TEAM Project~> Members:

- **[Ted Lemy](https://github.com/lemyted)**
- **[Alex Wallot](https://github.com/AlexWallot)**
- **[Luka Trudel](https://github.com/LukaTrudel)**
- **[Armughan Ayaz Janjua](https://github.com/armughanayaz)**



<br>

