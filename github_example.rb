require "sinatra"
require "http"

enable :sessions

get "/" do
  erb "<h1>Hello</h1><a href='https://github.com/login/oauth/authorize?client_id=#{ENV["GITHUB_CLIENT_ID"]}'>Authorize GitHub</a>"
end

get "/callback" do
  response = HTTP
    .headers(accept: "application/json")
    .post(
      "https://github.com/login/oauth/access_token",
      form: {
        client_id: ENV["GITHUB_CLIENT_ID"],
        client_secret: ENV["GITHUB_CLIENT_SECRET"],
        code: params[:code],
      },
    )
  pp response.parse
  session[:access_token] = response.parse["access_token"]
  redirect to "/profile"
end

get "/profile" do
  response = HTTP
    .headers("Authorization" => "token #{session[:access_token]}")
    .get("https://api.github.com/user")
  pp response.parse
  data = response.parse
  @name = data["name"]
  @image = data["avatar_url"]
  erb "<h1>Name: <%= @name %></h1><img src=<%= @image %>>"
end
