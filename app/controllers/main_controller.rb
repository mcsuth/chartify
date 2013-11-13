class MainController < ApplicationController
	def index
		unless current_user
			redirect_to 'login'
		end
	end

	def login
	end
end
