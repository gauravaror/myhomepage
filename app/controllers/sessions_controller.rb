class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    @user = User.authenticate(params[:email],params[:password]);
    if @user
      session[:user_id] = @user.id;
      redirect_to root_path
    else
      error[:base] = "Wrong Log In !! Please try again"
      render 'new'
    end  
  end
    
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
