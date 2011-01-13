require 'instapaper'

describe Instapaper do
  it "should return true when checking the authentication of a user with valid credentials" do
    username = 'jaystuff@shepjour.com'
    password = 'password'

    ip = Instapaper.new(username, password)
    ip.check_auth?.should == true
  end
  
  it "should return false when checking the authentication of a user with invalid credentials" do
    username = 'jaystuff@shepjour.com'
    password = 'bogus'
    
    ip = Instapaper.new(username, password)
    ip.check_auth?.should == false

  end
  
  it "should return a code of 403 when checking the auth of a user with invalid credentials" do
    username = 'jaystuff@shepjour.com'
    password = 'bogus'

    ip = Instapaper.new(username, password)
    if ip.check_auth? == false
      ip.return_code.should == "403"
    end
  end

  it "should return a code of 500 when there is a server problem"

  context "when a valid username and password" do
    before do
      @ip = Instapaper.new('jaystuff@shepjour.com','password')
    end
    it "should add a url" do
      @ip.add?("www.sprucecreeksoftware.com").should == true
    end  
  end



end


