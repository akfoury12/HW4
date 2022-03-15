class SessionsController < ApplicationController
def new
end

def create
@user = User.where({ email: params["email"] })[0]
if @user
if BCrypt::Password.new(@user.password) == params["password"]
session[:user_id] = @user.id
flash[:notice] = "Logged In"
redirect_to "/places"

else
flash[:notice] = "Login info incorrect"
redirect_to "/sessions/new"
end

else
flash[:notice] = "Login info incorrect"
redirect_to "/sessions/new"
end
end
  
def destroy
session[:user_id] = nil
flash[:notice] = "Logged out"
redirect_to "/sessions/new"
end
end