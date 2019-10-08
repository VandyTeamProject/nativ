class PagesController < ApplicationController
    def search  
        if params[:city].blank?  
          redirect_to(root_path, alert: "Empty field!") and return  
        else    
            @parameter = params[:city].downcase  
            puts @parameter

            @results = Place.all.where("lower(address) LIKE :city", city: "%#{@parameter}%")
        end  
    end
end

