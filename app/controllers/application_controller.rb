class ApplicationController < ActionController::Base
  protect_from_forgery
  
  private
    
    def sort_direction  
      %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"  
    end 
end
