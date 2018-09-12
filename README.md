# Tic-Tac-Toe


This is a ruby implementation of Tic-Tac-Toe game.


## Example run

[![EXAMPLE](https://github.com/hyoussef79/tic-tac/raw/master/assets/example.png)](https://github.com/hyoussef79/tic-tac)

## Setup & Run

This project is using:

+ ruby 2.5.1
+ bundler gem to install all required gems that are listed in [Gemfile][1].
+ rspec gem as the tests framework.
+ rubocop gem as a main coding style guide. Config can be found in [.rubocop.yml][2].



You need to install the dependencies first, follow these steps to install all required dependencies using [`RVM`][3]:

+ Install RVM

```shell
curl -sSL https://get.rvm.io | bash -s stable
```

+ Install/Use ruby 2.5.1 and create a gemset for this project

```shell
rvm use ruby-2.5.1@tic-tac --create
```

+ Install bundler gem

```shell
gem install bundler
```

+ Install gems listed in Gemfile

```shell
bundle install
```

+ Run application

```shell
ruby run.rb
```

+ Run tests

```shell
rspec
```

[1]: https://github.com/hyoussef79/tic-tac/blob/master/Gemfile
[2]: https://github.com/hyoussef79/tic-tac/blob/master/.rubocop.yml
[3]: https://rvm.io/rvm/install