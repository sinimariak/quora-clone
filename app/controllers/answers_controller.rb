post '/questions/:q_id/answer' do
	answer = Answer.new(title: params[:answer][:title], user_id: current_user.id, question_id: params[:q_id])
	answer.save
	redirect '/questions/' + params[:q_id]
end

get '/questions/my_answers' do
	@my_answers = current_user.answers.all
	erb :"static/my_answers"
end

delete '/questions/:q_id/:a_id' do
	Answer.delete = (params[:a_id])
	redirect '/questions/my_answers'
end

post '/questions/:q_id/:a_id/upvote' do
	answervote = Answervote.create(vote: '1', user_id: current_user.id, answer_id: params[:a_id])
	redirect '/questions/' + params[:q_id]

end

post '/questions/:q_id/:a_id/downvote' do
	answervote = Answervote.create(vote: '0', user_id: current_user.id, answer_id: params[:a_id])
	redirect '/questions/' + params[:q_id]
end