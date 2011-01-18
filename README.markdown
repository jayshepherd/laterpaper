# LaterPaper

Instapaper API Library for Ruby

# Usage

    l = LaterPaper.new('username','password')
    
    l.authenticate? # returns true if the username and password are valid
    
    l.status_code # returns the http status code from the InstaPaper call
    
    l.add(url) # will add the url to the account and return true if successfull.

# ToDo

* Remove URL
* Verify if a URL is already in use

# Contributing to LaterPaper
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

# Copyright

Copyright (c) 2011 Jay Shepherd. See LICENSE.txt for
further details.

