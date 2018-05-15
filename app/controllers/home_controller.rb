class HomeController < ApplicationController
	def index
		@users = User.all
	end
	def import_csv
		if params[:file].blank?
			flash[:notice] = "CSV Is Missing"
			redirect_to dashboard_path
		else
			@ext = File.extname(params[:file].path)
			if @ext == ".csv"
				User.import(params[:file])
					@users  = User.all
					respond_to do |format|  
						format.js { }
					end
			else
				flash[:notice] = "Please Upload the Csv File"
				redirect_to dashboard_path
			end
		end
	end
end
