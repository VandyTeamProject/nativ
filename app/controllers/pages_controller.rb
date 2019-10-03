class PagesController < ApplicationController
    def search  
        if params[:search].blank?  
          redirect_to(root_path, alert: "Empty field!") and return  
        else    
            @parameter = params[:search].downcase  
            puts @parameter
            @results = Place.all.where("lower(address) LIKE :search", search: "%#{@parameter}%")
        end  
    end
end

