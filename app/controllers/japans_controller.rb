class JapansController < ApplicationController
  before_action :set_japan, only: [:show, :edit, :update, :destroy]

  # GET /japans
  # GET /japans.json
  def index
    @japans = Japan.all
  end

  # GET /japans/1
  # GET /japans/1.json
  def show
  end

  def load
    def perform
    require 'watir'
    

    def connection
  @browser = Watir::Browser.new :chrome, headless: true
  # @browser.goto "https://auc.japonictrade.com/auctions/?p=project/findlots&s&ld"
  @browser.goto"http://encheres.clubimport.fr/auctions/?p=project/lot&id=550986806&s"
  mail = @browser.text_field(id: "usr_name") # select barre de recherche
  mail.set("Manada") # search

  mdp = @browser.text_field(id: "usr_pwd") # select barre de recherche
  mdp.set("rabaytis54") # search

  mdp.send_keys(:enter)

  @a = @browser.body.text
    end

    connection

    sleep(5)
  #mercedes
  # @browser.element(:xpath => "/html/body/table/tbody/tr[2]/td/table[1]/tbody/tr[2]/td/form/table/tbody/tr/td/table/tbody/tr[2]/td[1]/table[2]/tbody/tr[1]/td[1]/table/tbody/tr[1]/td[2]/div/select/optgroup[2]/option[5]").click
  
  @browser.element(:xpath => "/html/body/table/tbody/tr[2]/td/table[1]/tbody/tr[2]/td/form/table/tbody/tr/td/table/tbody/tr[2]/td[1]/table[2]/tbody/tr[1]/td[1]/table/tbody/tr[1]/td[2]/div/select/optgroup[2]/option[2]").click
  sleep(3)
  @browser.element(id: "btnSearsh").click

  def page
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
    # @browser.goto "javascript:page(#{@c})"
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
  # @liens.each do
  #   @browser.goto @liens[r]
  #   # sleep(3)
  #   prix_fixe
  #   r += 1
  # end
  end

  page
  @browser.close

  end
  perform
  # @liens
  #
  
  @existant = []
  voiture_deja = Japan.all

  voiture_deja.each do |f|
    @existant << f.numcar
  end
  # puts @liens
  # puts @existant
  @new_car = []
  # puts "nex"
  # puts @new_car
  @new_car = @liens - @existant 
  # puts @new_car
  # @new_car2 = @existant - @liens
   @new_car.each do |f| 
     Japan.create!(numcar: f, model: "bmw")    
  end
  puts @liens.size
  puts @existant.size
  puts @new_car.size
  # puts @new_car2.sizeto_i
  @po = Japan.all.size 
end

  # GET /japans/new
  def new
    @japan = Japan.new
  end

  # GET /japans/1/edit
  def edit
  end

  # POST /japans
  # POST /japans.json
  def create
    @japan = Japan.new(japan_params)

    respond_to do |format|
      if @japan.save
        format.html { redirect_to @japan, notice: 'Japan was successfully created.' }
        format.json { render :show, status: :created, location: @japan }
      else
        format.html { render :new }
        format.json { render json: @japan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /japans/1
  # PATCH/PUT /japans/1.json
  def update
    respond_to do |format|
      if @japan.update(japan_params)
        format.html { redirect_to @japan, notice: 'Japan was successfully updated.' }
        format.json { render :show, status: :ok, location: @japan }
      else
        format.html { render :edit }
        format.json { render json: @japan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /japans/1
  # DELETE /japans/1.json
  def destroy
    @japan.destroy
    respond_to do |format|
      format.html { redirect_to japans_url, notice: 'Japan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_japan
      @japan = Japan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def japan_params
      params.fetch(:japan, {})
    end
end
