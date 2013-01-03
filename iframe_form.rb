require 'sinatra/base'

class IframeForm < Sinatra::Base

  get '/a' do
    code = ''
    code += '<h1>Page A</h1>'

    code += '<iframe src="/b" name="b_frame" width=600 height=600></iframe>'

    erb code
  end

  get '/b' do
    code = ''
    code += '<h1>Page B</h1>'

    code += '<iframe src="/c" name="c_frame" width=500 height=500></iframe>'

    erb code
  end

  get '/c' do
    code = ''
    code += '<h1>Page C</h1>'
    code += '<form action="/c" method="post"><input id="c_field" type="input" value=""></form>'
    erb code
  end

end