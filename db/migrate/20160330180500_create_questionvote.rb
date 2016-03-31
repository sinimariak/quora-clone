class CreateQuestionvote < ActiveRecord::Migration
	def change
		create_table :questionvotes do |t|
			t.string :user_id
			t.string :question_id
			t.integer :vote
		end
	end
end