class ApplicationController < ActionController::Base
  protect_from_forgery

  def login_required
    redirect_to :controller => "users", :action => "new" if current_user.blank?
  end


  def draw(data)

   pdf = PDF::Writer.new

#   sam = ActiveSupport::JSON.decode(data)

#   sam["project"].each do |output|
#    pdf.text output
#    pdf.text "hello"
#    
#   end
   
    data["project"].each do |output|
     pdf.text output.to_s
#     pdf.text '   '
    end
    pdf.render
    
  end

  def get_json
   #base_url = "http://localhost:3000/books.json"
   #base_url = "greenova.bitnamiapp.com","/redmine/projects.json?&key=ec6c5c86a1a3fed56384a0c2ded9ee93d4bafb9b"
   

   resp = Net::HTTP.get_response("greenova.bitnamiapp.com","/redmine/projects/greenova-mobiledev.json?&key=ec6c5c86a1a3fed56384a0c2ded9ee93d4bafb9b")
   data = resp.body
   puts data.class
   puts data


   return JSON.parse(data)
    
  end

  
  private  
  
  def current_user  
    @current_user ||= User.find(session[:user_id]) if session[:user_id]  
    puts @current_user, "session id is"
    puts session[:user_id]  
    puts "that is the session id"
    return @current_user
  end  
  
  helper_method :current_user  
end
