# new - register user
get '/users/new' do 
	erb :"static/new_user"
end

# create
post '/users/new' do
	user = User.new(name: params[:user][:name], email: params[:user][:email])
	user.password = params[:user][:password]
	if user.save
		session[:user_id] = user.id
		redirect '/home'
	else
		session['error_message'] = user.errors.messages
		redirect '/'
	end
end

# show
get '/users/:id' do
	user = User.find_by(id: session[:user_id])
	erb :"static/users"
end


# Sessions
get '/' do
	@users = User.all
	@user = user
	erb :"static/index"
end

post '/login' do
	user = User.find_by(email: params[:user][:email])
	if user.authenticate(params[:user][:password])
			session[:user_id] = user.id
			redirect '/home'
	else 
		redirect '/'
		#include error message?
	end
end

get '/logout' do
	session.clear
	redirect '/'
end
