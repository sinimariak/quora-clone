class CreateQuestionvote < ActiveRecord::Migration
	def change
		create_table :questionvotes do |t|
			t.string :question_id
			t.string :type
		end
	end
end
