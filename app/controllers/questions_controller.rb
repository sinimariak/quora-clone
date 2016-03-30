#show list of questions
get '/home' do
	@questions = Question.all.order(created_at: :desc)
	erb :"static/home"
end

post '/ask' do
	question = Question.new(title: params[:question][:title], user_id: current_user.id)
	question.save
	redirect '/questions'
end

get '/questions' do
	@questions = Question.all.order(created_at: :desc)
	erb :"static/questions"
end

get '/questions/my_questions' do
	@my_questions = current_user.questions.all
	erb :"static/my_questions"
end

get '/questions/:id' do
	@question = Question.find(params[:id])
	@answers = Answer.where(question_id: @question.id).all
	erb :"static/current_question"
end



