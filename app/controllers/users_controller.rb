class UsersController < ApplicationController

  def new  
    @user = User.new  
  end  
  
  def create  
    @user = User.new(params[:user])  
    if @user.save  
      @notice = "Signed up!"  
    else  
      render "new"  
    end  
  end  

  def print
    @clients = User.find :all
    rghost_render :pdf, :filename => 'invoice022009.pdf'
  end

end
