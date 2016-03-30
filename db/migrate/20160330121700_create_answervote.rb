class CreateAnswervote < ActiveRecord::Migration
	def change
		create_table :answervotes do |t|
			t.string :answer_id
			t.string :type
		end
	end
end