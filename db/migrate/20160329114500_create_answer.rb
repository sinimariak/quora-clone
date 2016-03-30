class CreateAnswer < ActiveRecord::Migration
	def change
		create_table :answers do |t|
			t.string :title
			t.string :question_id
			t.string :user_id

			t.timestamps

		end
	end
end