class ImgCar

  def perform(num)
    @num = num
    require 'watir'
      require 'pry'

      if Rails.env.production?
        @browser = Watir::Browser.new :chrome, headless: true
        go
      else
        @browser = Watir::Browser.new :firefox
        go
      end

      @foto    
  end

  def go
    connection
    fotos
    @browser.close
  end

  def connection
    @browser.goto"http://encheres.clubimport.fr"
    mail = @browser.text_field(id: "usr_name") # select barre de recherche
    mail.set("Manada") # search

    mdp = @browser.text_field(id: "usr_pwd") # select barre de recherche
    mdp.set("rabaytis54") # search

    mdp.send_keys(:enter)
    sleep(4)

    @browser.goto"http://encheres.clubimport.fr/auctions/?p=project/lot&id=#{@num}&s"
  end

  def fotos
    b = @browser.td(:xpath => "/html/body/table/tbody/tr[2]/td/table[1]/tbody/tr[2]/td/table/tbody/tr[2]/td[1]/table/tbody/tr/td[1]/table/tbody/tr[1]/td/table/tbody/tr[2]/td[2]/table/tbody/tr[2]/td").as
    @foto = ""
    b.each do |f|
      @foto += f.href + ","
    end
  end




end