class ApplicationController < ActionController::Base
   def hello
      render html: "Hello World from main page"
   end
end
