#show list of questions
get '/home' do
	@questions = Question.all.order(created_at: :desc)
	erb :"static/home"
end

post '/questions' do
	question = Question.new(title: params[:question][:title], user_id: current_user.id)
	question.save
	redirect '/home'
end

get '/questions' do
	@questions = Question.all.order(created_at: :desc)
	erb :"static/home"
end

get '/questions/my_questions' do
	@my_questions = current_user.questions.all
	erb :"static/my_questions"
end

get '/questions/:q_id' do
	@question = Question.find(params[:q_id])
	@answers = Answer.where(question_id: @question.id).all
	erb :"static/current_question"
end

delete '/questions/:q_id' do
	Question.delete(params[:q_id])
	redirect '/questions/my_questions'
end

post '/questions/:q_id/upvote' do
	questionvote = Questionvote.create(vote: '1', user_id: current_user.id, question_id: params[:q_id])
	redirect '/home'
end

post '/questions/:q_id/downvote' do
	questionvote = Questionvote.create(vote: '0', user_id: current_user.id, question_id: params[:q_id])
	redirect '/home' 
end


