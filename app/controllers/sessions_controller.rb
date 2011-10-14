class SessionsController < ApplicationController
  def new  
  end  
  
	def create  
	  user = User.find_by_email(params[:email])  
	  if user && user.authenticate(params[:password])  
	    session[:user_id] = user.id  
	    redirect_to :controller => "welcome", :action => "index", :notice => "Logged in!"  
	  else  
	    flash[:notice] = "Invalid email or password"  
	    render "create"  
	  end  
	end   
  
  def destroy  
    session[:user_id] = nil  
#    render "create"
    redirect_to :action => "new"
  end

end
