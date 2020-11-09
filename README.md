# README

# Fitness Calendar

Ruby application which is made for booking trainings with specific coach.
<b>Important note: application is still in progess.</b>


## Getting started
To get started, clone the repo and then install the needed gems:
```
$ bundle install --without production
```
Next, migrate the database:
```
$ rails db:migrate
```
You can run this app in a local server:
```
$ rails server
```

## Usage
Application is made for users who want to book personal trainings with a coach. If they want to make a reservation, they have to sign up first. Only sign in user can book a training. There are also 30 sample users shipped along with this app as default (shown in db/seeds.rb file).<br>
If you want to see how this application works, please use my sample user to sign in:
```
email: sampleuser@mail.com
password: foobar
```
This application use [gem Devise](https://github.com/heartcombo/devise) to authentication.

## In progess
I am still working to add new possibilities. Next step is add a coach model. Users will choose with which coach they want to train and they will see which coach have free hours in specific day. Coaches will have different site to sign in. They will see there a calendar of their trainings.

## Author
Joanna Klosinska
