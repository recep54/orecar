class JapCar

    def perform
      require 'watir'

      if Rails.env.production?
        @browser = Watir::Browser.new :chrome, headless: true
        go
      else
        @browser = Watir::Browser.new :firefox
        go
      end
    end

    def go

      @browser.goto"http://encheres.clubimport.fr/"
      @browser.close
    end


end
