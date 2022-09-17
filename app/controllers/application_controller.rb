class ApplicationController < ActionController::Base
   def hello
      render html: "meu primeiro teste com Ruby on Rails"
   end
end
