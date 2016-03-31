class CreateAnswervote < ActiveRecord::Migration
	def change
		create_table :answervotes do |t|
			t.string :user_id
			t.string :answer_id
			t.integer :vote
		end
	end
end