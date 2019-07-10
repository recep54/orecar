class ImgCar

  def perform
    require 'watir'
      require 'pry'

      if Rails.env.production?
        @browser = Watir::Browser.new :chrome, headless: true
        connection
        
      else
        @browser = Watir::Browser.new :firefox
        connection
        
      end
      
      @foto    
  end

  

  def connection
    @browser.goto"http://encheres.clubimport.fr"
    mail = @browser.text_field(id: "usr_name") # select barre de recherche
    mail.set("Manada") # search

    mdp = @browser.text_field(id: "usr_pwd") # select barre de recherche
    mdp.set("rabaytis54") # search

    mdp.send_keys(:enter)
    sleep(4)

    
  end

  def fotos(num)
    @num = num
    @browser.goto"http://encheres.clubimport.fr/auctions/?p=project/lot&id=#{@num}&s"
    b = @browser.td(:xpath => "/html/body/table/tbody/tr[2]/td/table[1]/tbody/tr[2]/td/table/tbody/tr[2]/td[1]/table/tbody/tr/td[1]/table/tbody/tr[1]/td/table/tbody/tr[2]/td[2]/table/tbody/tr[2]/td").as
    @foto = ""
    b.each do |f|
      @foto += f.href + ","
    end
    @foto
  end

  def finn
    @browser.close
  end


end