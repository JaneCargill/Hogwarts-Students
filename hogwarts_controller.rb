require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative('models/student') 

get '/students' do
  @students = Student.all()
  erb (:index)
end

get '/students/new' do 
  erb( :new )
end

get '/students/:id' do
  @student = Student.find( params[:id] ) #new
  erb( :show ) #new
end