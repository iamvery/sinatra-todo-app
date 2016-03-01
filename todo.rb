require "sinatra/base"

class ToDoApp < Sinatra::Base
  get "/" do
    erb :index
  end
end
