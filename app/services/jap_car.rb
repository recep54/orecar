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

      @liens      
    end

    def go

      @browser.goto"http://encheres.clubimport.fr/"
      connection
      page
      @browser.close
    end

    def connection
      @browser.goto"http://encheres.clubimport.fr/auctions/?p=project/lot&id=550986806&s"
      mail = @browser.text_field(id: "usr_name") # select barre de recherche
      mail.set("Manada") # search

      mdp = @browser.text_field(id: "usr_pwd") # select barre de recherche
      mdp.set("rabaytis54") # search

      mdp.send_keys(:enter)

      @a = @browser.body.text
      sleep(5)
    end



  def page

    @browser.element(:xpath => "/html/body/table/tbody/tr[2]/td/table[1]/tbody/tr[2]/td/form/table/tbody/tr/td/table/tbody/tr[2]/td[1]/table[2]/tbody/tr[1]/td[1]/table/tbody/tr[1]/td[2]/div/select/optgroup[2]/option[2]").click
    sleep(3)
    @browser.element(id: "btnSearsh").click
    @b = @browser.element(:xpath => "/html/body/table/tbody/tr[2]/td/table[1]/tbody/tr[2]/td/form/table/tbody/tr/td[2]/table/tbody/tr/td/div[1]/b/font").text
    @a = @b.to_i
    @a = @a / 100
    @a += 1
    puts @a
    @c = 2
    sleep(2)
    @liens = []
  # @a.times do
      1.times do   
        lien
    @browser.goto "javascript:page(#{@c})"
        sleep(2)

    # lien
    # @browser.element(:xpath => "/html/body/table/tbody/tr[2]/td/table[1]/tbody/tr[2]/td/form/table/tbody/tr/td[2]/table/tbody/tr/td/a[#{b}]").click
        @c += 1
      end
  end

  def lien
    sleep(1)
    @browser.elements(class: "red").each do |i|
    # puts i.href
      @liens << i.href[57 .. -3].to_i
    end
    
    puts @liens.size
    r = 0
  end

end
