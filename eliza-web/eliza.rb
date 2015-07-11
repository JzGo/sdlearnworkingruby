require_relative 'lib/eliza_questions'
require 'rack'

app = Proc.new do |env|
  # puts env
  req = Rack::Request.new env
  user_response = req.params['user_input']

  if user_input = Nil
    ['200', {'Content-Type' => 'text/html'}, ["
    <form>
    <input class='text' name='user_input'><br>
    <button type='submit' >OK</input>"]]

  else
    ['200', {'Content-Type' => 'text/html'}, ["
    <form>
    <input class='text' name='user_input'><br>
    <button type='submit' >OK</input>"]]
  end

end

Rack::Handler::WEBrick.run app
