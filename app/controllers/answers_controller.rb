post '/questions/:q_id/answer' do
	answer = Answer.new(title: params[:answer][:title], user_id: current_user.id, question_id: params[:q_id])
	answer.save
	redirect '/questions/' + params[:q_id]
end

get '/questions/my_answers' do
	@my_answers = current_user.answers.all
	erb :"static/my_answers"
end

