require 'uri'
require 'net/http'

class Instapaper
  def initialize(username, password)
    @username = username
    @password = password
    @return_code = 0
  end

  def check_auth?
    execute_url_command(url_for_authentication)
    return ( @return_code == "200" )
  end

  def add?(url)
    execute_url_command(base_url_for_add << "&url=#{url}")
    return ( @return_code == "201" )
  end
 
  def execute_url_command(url)
    command = URI.parse(url)
    Net::HTTP.start(command.host) do |http|
      @return_code = http.head(command.request_uri).code
    end
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
