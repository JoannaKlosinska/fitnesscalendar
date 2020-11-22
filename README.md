# README

# Fitness Calendar

Ruby application which is made for booking trainings with specific coach. <br>
Technologies: Ruby 2.7, Rails 6.0, HTML5, CSS3.
<b>Important note: application is still in progess.</b>


## Getting started
To get started, clone the repo and then install the needed gems:
```
$ bundle install
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
You can also sign in as a coach. Coaches have different login page, you need to add to homepage address: '/coach/sign_in'. After sign in, you will see a page for a coach, coach's schedule and trainings with customers. Coaches can't sign up by their own. There are also 5 sample coaches shipped along with this app as default (shown in db/seeds.rb file). <br>
Please use my sample coach to sign in:
```
email: mikecoach@mail.org
password: password
```
This application use [gem Devise](https://github.com/heartcombo/devise) to authentication.

## In progess
I am still working to add new possibilities. Next step is add a schedule to coach page. In this schedule, coach will choose in which hours and days during whole week he can work.

## Author
Joanna Klosinska
