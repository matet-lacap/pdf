class WelcomeController < ApplicationController
#  before_filter :login_required, :only => :index


  def index
    @output = get_json()


     respond_to do |format|
      format.html # index.html.erb
      format.pdf do        
          send_data draw(@output), :filename => 'products.pdf', :type => 'application/pdf', :disposition => 'inline'
      end
      format.json { render :json => @output }
       format.xml{ render :xml => @output }
    end

  end

end
