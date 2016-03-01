require "sinatra/base"
require "./task"
require "data_mapper"

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/to_do_app")

DataMapper.finalize
Task.auto_upgrade!

class ToDoApp < Sinatra::Base
  get "/" do
    @tasks = Task.all
    erb :index
  end

  post "/" do
    Task.create(params)
    redirect "/"
  end
end
