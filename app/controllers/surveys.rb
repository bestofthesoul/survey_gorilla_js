# READ- READ
get '/surveys' do  #THIS LINK ON LAYOUT (APPLIED TO ALL PAGES)
  @user = User.find(session[:id])
  @surveys = @user.surveys
  erb :"surveys/index"
end


# READ - SHOW
get '/surveys/:id' do
  @survey = Survey.find(params[:id])
  @questions = @survey.questions
  erb :'surveys/show'
end

#CREATE - CREATE
post '/surveys/create' do
  @user = User.find(session[:id])
  @survey = @user.surveys.new(params[:survey])

  if @survey.save
    redirect to "/surveys/#{@survey.id}"
  else
    erb :"surveys/index"
  end

end

