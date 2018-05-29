class DashboardController < ApplicationController
    
    def show_home
        
        render("/dashboard_templates/home.html.erb")
    end
    
end