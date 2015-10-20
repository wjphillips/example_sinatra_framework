require_relative 'frank'
map('/welcomes') {run WelcomesController}
map('/users') {run UsersController}