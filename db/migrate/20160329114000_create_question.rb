class CreateQuestion < ActiveRecord::Migration
	def change
		create_table :questions do |t|
			t.string :title
			t.string :user_id

			t.timestamps

		end
	end
end