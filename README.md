# Firelog  
Collect temperature data from your Nest thermostat.

## Installation

Click [![Deploy to Heroku](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy?template=https://github.com/dombarnes/firelog/tree/master) or `git clone` the repo, run `bundle install` then `bundle exec rake db:setup db:migrate`, configure the three environment variables, run `rake temps` and set up the Heroku scheduler to run as often as you like.

## Tools
This app is built on:  
• Ruby  
• Sinatra  
• Postrgres (for storing data)  
• ActiveRecord  
• Bootstrap and ChartJS for interface  

