require_relative 'lib/eliza_questions'
require 'rack'

app = Proc.new do |env|
  puts env
  ['200', {'Content-Type' => 'text/html'}, ["
    <form>
    <input class='text' name='user_input'><br>
    <button type='submit' >OK</input>"]]
end

Rack::Handler::WEBrick.run app
