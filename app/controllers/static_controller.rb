class StaticController < ApplicationController
	def show
		if valid_page?
			render template: "static/#{params[:page]}"
		else
			render file: "public/404.html", status: :not_found
		end
    end


    def catch_404
    	render file: "public/404.html", status: :not_found
  	

	end


    private 
    def valid_page?
    	File.exist?(Pathname.new(Rails.root + "app/views/static/#{params[:page]}.html"))
    end
end
