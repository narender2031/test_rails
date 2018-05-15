class User < ApplicationRecord
	
	def self.import(file)
		CSV.foreach(file.path, :headers => true) do |row|
			begin
				User.create! row.to_h
			rescue Exception => error
				@error = error.message
			end
		end	
	end
end
