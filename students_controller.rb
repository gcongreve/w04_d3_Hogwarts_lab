require('sinatra')
require('sinatra/contrib/all')
require_relative('models/student')
require_relative('models/house')
also_reload('./models/*')

# index
get '/students' do
  @students = Student.all()
  erb(:index)
end

# new
get '/students/new' do
  erb(:new)
end

# create
post '/students' do
  @student = Student.new(params)
  @student.save
  redirect to '/students'
end


# show
get '/students/:id' do
  @student = Student.find(params[:id])
  erb(:show)
end

# edit
get '/students/:id/edit' do
  @student = Student.find(params[:id])
  #@houses = [1,2,3,4]
#  @houses = ["Gryffindor", "Hufflepuff", "Ravenclaw", "Slytherin"]
  erb(:edit)
end

# update
post '/students/:id' do
  @student = Student.new(params)
  @student.update
  redirect to '/students/' + params[:id]
end

# destroy
post '/students/:id/delete' do
  @student = Student.find(params[:id])
  @student.delete
  redirect to "/students"
end
