require "sinatra"
require "http"

enable :sessions

get "/" do
  erb "<a href='https://accounts.spotify.com/authorize?client_id=#{ENV["SPOTIFY_CLIENT_ID"]}&response_type=code&redirect_uri=http://localhost:4567/callback'>Authorize Spotify</a>"
end

get "/callback" do
  response = HTTP
    .post(
      "https://accounts.spotify.com/api/token",
      form: {
        grant_type: "authorization_code",
        code: params[:code],
        redirect_uri: "http://localhost:4567/callback",
        client_id: ENV["SPOTIFY_CLIENT_ID"],
        client_secret: ENV["SPOTIFY_CLIENT_SECRET"],
      },
    )
  pp response.parse
  session[:access_token] = response.parse["access_token"]
  redirect to "/profile"
end

get "/profile" do
  response = HTTP
    .headers("Authorization" => "Bearer #{session[:access_token]}")
    .get("https://api.spotify.com/v1/me")
  data = response.parse
  @name = data["display_name"]
  erb "<h1>Name: <%= @name %></h1>"
end
