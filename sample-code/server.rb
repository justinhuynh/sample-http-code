require "sinatra"
require "pry"

get "/tasks" do
  @tasks = ["pay bills", "buy milk", "learn Ruby"]
  erb :index
end

get "/tasks/:task_name" do
  @task_name = params[:task_name]
  erb :show
end

get "/tasks" do
  @tasks = File.readlines("tasks.txt")
  erb :index
end

post "/tasks" do
  task = params["task_name"]

  File.open("tasks.txt", "a") do |file|
    file.puts(task)
  end

  redirect "/tasks"
end
