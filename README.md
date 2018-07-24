# WhyBuy ![CI status](https://img.shields.io/badge/build-passing-brightgreen.svg)

## Introduction
>[Whuybuy heroku link](https://whybuy.herokuapp.com/)

>[Whybuy Github repository](https://github.com/LongNguyen206/whybuyApp)

The idea behind the app is to allow people to rent something that they would only use once or very rarely. Rather than buying that expensive drill that you will only use for 15 mins, why not rent it from your neighbor? 

The problems addressed:
- modern culture of overconsumption
- environmental awareness by cutting packaging waste
- allows people to try something before committing to buy it
- allows for lighter travel: rent everything you need at the destination!
- efficient use of company's assets: you can rent out unused equipment!

## Development process

### Working on user story

I used Trello to develop the whole user story.
![alt text](https://github.com/LongNguyen206/whybuyApp/blob/master/app/assets/images/trello1.png)
![alt text](https://github.com/LongNguyen206/whybuyApp/blob/master/app/assets/images/trello2.png)
![alt text](https://github.com/LongNguyen206/whybuyApp/blob/master/app/assets/images/trello3.png)
![alt text](https://github.com/LongNguyen206/whybuyApp/blob/master/app/assets/images/trello4.png)

I used color codes to priorities the tasks with
- blue : mandatory functionality
- yellow : first-order optional
- orange : second-order optional
- purple : if I have time
- green : completed tasks

## Designing database

This was the most challenging part for me. It was difficult to capture all the relationship from the first time, therefore I had a few versions of it before I came up with the final version. Needless to say, the actual database schema is lacking compared to the original version
![alt text](https://github.com/LongNguyen206/whybuyApp/blob/master/app/assets/images/erd1.png)
![alt text](https://github.com/LongNguyen206/whybuyApp/blob/master/app/assets/images/erd2.png)
![alt text](https://github.com/LongNguyen206/whybuyApp/blob/master/app/assets/images/erd_final.pdf)

## Git workflow

Because this was a solo project, my github workflow looked like this:
1. Create a remote repositoty on github, initialize it inside my newly created app
2. Create a branch on my local repo, called 'dev'. This is where most of the work happened
3. Any changes would be staged and committed withing the dev branch
4. Every 3-5 commits, I would merge the 'dev' branch into the local 'master' branch
5. Push master branch to origin
6. Checkout back to 'dev' and continue work

## Features
1. Users can register and create their profile
2. Images get stored on AWS 
3. Profiles can be set up as either individual or company
4. Users can create a listing with a daily rate and deposit
5. Users can send rent requests for other people's listings
6. After the total price is calculated, users pay with Stripe and get a notification on email
7. The Admin role has unlimited access to the app's data

# Built With
- [Devise](https://github.com/plataformatec/devise)  
- [Bootstrap](https://github.com/twbs/bootstrap-rubygem) 
- [PureSass](https://github.com/rubysamurai/purecss-sass)
- [Stripe](https://stripe.com/au)
- [Carrierwave](https://github.com/carrierwaveuploader/carrierwave)
- [Simple Form](https://github.com/plataformatec/simple_form)
- [Figaro](https://github.com/laserlemon/figaro)