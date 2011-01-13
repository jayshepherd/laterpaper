require 'laterpaper'

describe LaterPaper do

  context "with invalid username or password" do
    before do
      @ip = LaterPaper.new('jaystuff@shepjour.com','bogus')
    end

    it "should return false when checking the credentials" do
      @ip.check_auth?.should == false
      @ip.return_code.should == "403"
    end
  end
  
  context "with a valid username and password" do
    before do
      @ip = LaterPaper.new('jaystuff@shepjour.com','password1')
    end
  
    it "should return true when checking the credentials" do
      @ip.check_auth?.should == true
    end
    
    it "should succeeed on a valid url" do
      @ip.add?("www.sprucecreeksoftware.com").should == true
    end 

    it "should fail with a 400 on an invalid url" do
      @ip.add?("http://www.foobar.com").should == false
      @ip.return_code.should == "404"
    end

    it "should fail with a 403 on an invalid username and password"

    it "should fail with a 500 if there is a server problem"

    it "should fail with a 400 if there is no url provided" do
      @ip.add?("").should == false
      @ip.return_code.should == "400"
    end

  end

  it "should return a code of 500 when there is a server problem"

end


