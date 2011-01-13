require 'uri'
require 'net/http'

class Instapaper
  def initialize(username, password)
    @username = username
    @password = password
    @return_code = 0
    @authenticate_url = 'https://www.instapaper.com/api/authenticate'
  end

  def test
    puts "testing from test"
    puts @authenticate_url
  end
  
  def check_auth
    url = URI.parse(@authenticate_url << "?username=#{@username}&password=#{@password}")
    Net::HTTP.start(url.host) do |http|
      @return_code = http.head(url.request_uri).code
      return ( @return_code == "200" )
    end
  end

  def return_code
    @return_code
  end

end
