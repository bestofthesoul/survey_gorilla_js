# READ- READ
get '/surveys' do  #THIS LINK ON LAYOUT (APPLIED TO ALL PAGES)
  @user = User.find(session[:id])
  @surveys = @user.surveys
  erb :"surveys/index"
end

#CREATE-CREATE 1
get '/surveys/create' do
    erb :"surveys/create"
end

#CREATE-SHOW 1
post '/surveys/create' do
  @user = User.find(session[:id])
  @survey = @user.surveys.find_or_initialize_by(params[:survey])

  if @survey.save
    erb :"surveys/create2"
  else
    redirect to '/'
  end

end

#CREATE-SHOW 2
post '/surveys/:id/create' do
  @survey = Survey.find(params[:id])

  params[:question].each do |k, v|
  @survey.questions.create(description: v)
  end

  @question = @survey.questions.last

  params[:choice].each do |k, v|
  @question.choices.create(description: v)
  end

  redirect to "/surveys/#{@survey.id}"

end


# READ - SHOW
get '/surveys/:id' do
  @survey = Survey.find(params[:id])

  erb :"surveys/show"
end


post '/surveys/:id/complete' do
  @user = User.find(session[:id])
  @survey = Survey.find(params[:id])
  
  @survey.questions.each_with_index do |question, index|
  @answer =Answer.create(question: question, choice_id: params[:questions].values[index])
  end
  
  erb :complete
end
