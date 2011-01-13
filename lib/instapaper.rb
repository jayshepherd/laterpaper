require 'uri'
require 'net/http'

class Instapaper
  def initialize(username, password)
    @username = username
    @password = password
    @return_code = 0
  end

  def check_auth?
    execute_url_command(auth_url('authenticate'))
    return ( @return_code == "200" )
  end

  def add?(url)
    execute_url_command(auth_url("add") << "&url=#{url}")
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

  def auth_url(command)
    if @username.include?("@")
      "https://www.instapaper.com/api/#{command}/" << "?username=#{@username}&password=#{@password}"
    else
      "https://#{@username}:#{@password}@www.instapaper.com/api/#{command}/"
    end
  end
end
