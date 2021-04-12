require "sinatra"
require "http"

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
  access_token = response.parse["access_token"]
  response = HTTP
    .headers("Authorization" => "token #{access_token}")
    .get("https://api.github.com/user")
  pp response.parse
  redirect to "/"
end
