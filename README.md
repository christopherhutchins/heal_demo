# heal_demo

## Setup(OSX)
Install xcode

`$ xcode-select --install`

The prompt will ask you to install command line tools; install it.

Install ruby via RVM

`$ \curl -sSL https://get.rvm.io | bash -s stable --ruby`

`$ rvm use 2.4.0 --default`

Install bundler gem

`$ gem install bundler`

`$ bundle install`

## Run Test

`$ bundle exec rspec spec/ -fd`
