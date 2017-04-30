# Heal demo

## Setup(OSX)
### Install Google Chrome

https://www.google.com/chrome/browser/features.html

### Install xcode in the command line

`$ xcode-select --install`

The prompt will ask you to install command line tools; install it.

### Install ruby via RVM in the command line

`$ \curl -sSL https://get.rvm.io | bash -s stable --ruby`

Follow any directions in the prompt after RVM has finished installing.

Then...

`$ rvm use 2.4.0 --default`

### Install bundler gem in the command line

`$ gem install bundler`

`$ bundle install`

## Run Test in the command line

`$ bundle exec rspec spec/ -fd`
