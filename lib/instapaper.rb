require 'uri'
require 'net/http'

class Instapaper
  def initialize(username, password)
    @username = username
    @password = password
    @return_code = 0
  end

  def test
    puts "testing from test"
    puts @authenticate_url
  end
  
  def check_auth
    url = URI.parse(url_for_authentication)
    Net::HTTP.start(url.host) do |http|
      @return_code = http.head(url.request_uri).code
      return ( @return_code == "200" )
    end
  end

  def add(url)
    url = base_url_for_add << "?url=#{url}" 
    

  end
  
  def return_code
    @return_code
  end

  private

  def url_for_authentication
    'https://www.instapaper.com/api/authenticate' << credentials_params
  end

  def base_url_for_add
    'https://www.instapaper.com/api/add' << credentials_params
  end

  def credentials_params
    "?username=#{@username}&password=#{@password}"
  end
end
