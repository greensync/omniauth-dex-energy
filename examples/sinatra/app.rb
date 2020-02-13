require 'omniauth/strategies/dex_energy'
require 'sinatra'
require 'slim'

oauth2_client_id = ENV['OAUTH2_CLIENT_ID']
oauth2_client_secret = ENV['OAUTH2_CLIENT_SECRET']

use Rack::Session::Cookie

use OmniAuth::Builder do
  provider :dex_energy, oauth2_client_id, oauth2_client_secret,
           client_options: {
             site: 'https://who.dex.energy',
           }
end

get '/' do
  @user = session[:user]
  slim :hello
end

get '/login' do
  # Redirect the user to the endpoint provided by OmniAuth.
  redirect to("/auth/dex_energy?origin=#{URI.encode_www_form_component(request.referrer)}")
end

get '/auth/dex_energy/callback' do
  # Handle a completed OAuth2 login flow.
  logger.warn(request.env['omniauth.auth'].to_h)
  session[:user] = request.env.fetch('omniauth.auth').uid
  redirect params.fetch(:origin, '/')
end

get '/logout' do
  # Log the user out of their session in the app - but not in the Identity Provider.
  session.delete(:user)
  redirect request.referrer
end
