class UsersController < ApplicationController
	get '/' do
		@title = 'All Users'
		erb :main_layout do
			@users = User.all
			erb :"users/index"
		end
	end
	get '/new' do
		@title = 'New User Form'
		erb :main_layout do
			erb :"users/new"
		end
	end
	get '/:id' do
		@title = 'User Information'
		erb :main_layout do
			@user = User.find(params[:id])
			erb :"users/show"
		end
	end
	get '/:id/edit' do
		@title = 'Edit Profile Information'
		erb :main_layout do
			@user = User.find(params[:id])
			erb :"users/edit"
		end
	end
	post '/' do
		user = User.new
		user.email = params[:email]
		user.first_name = params[:first_name]
		user.last_name = params[:last_name]

		password_salt = BCrypt::Engine.generate_salt
		password_hash = BCrypt::Engine.hash_secret('password', password_salt)

		user.salt = password_salt
		user.encrypted_password = password_hash
		user.save

		redirect '/users'
	end
	patch '/:id' do
		user = User.find(params[:id])
		user.first_name = params[:first_name]
		user.last_name = params[:last_name]
		user.email = params[:email]
		user.save
		redirect '/users'
	end
	delete '/:id' do
		user = User.find(params[:id])
		user.destroy
		redirect '/users'
	end
end