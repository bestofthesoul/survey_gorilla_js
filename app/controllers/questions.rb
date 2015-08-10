# CREATE NEW QUESTION
post '/surveys/:survey_id/questions/create' do

  @user = User.find(session[:id])
  @survey = Survey.find(params[:survey_id])
  @question = @survey.questions.new(params[:question])
  @question.survey.user = @user

  if @question.save

    redirect to "/surveys/#{@survey.id}/questions/#{@question.id}/choices"
  else
    redirect to "/surveys/#{@survey.id}"
  end

end

get '/surveys/:survey_id/questions/:id/choices' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.find(params[:id])
  erb :"questions/choices"
end 

  
post '/surveys/:survey_id/questions/:id/choices/create' do
  @survey = Survey.find(params[:survey_id])
  @question = Question.find(params[:id])

  @choiceone = @question.choices.create(description: params[:choice][:one])
  @choicetwo = @question.choices.create(description: params[:choice][:two])
  erb :"questions/show"
end
