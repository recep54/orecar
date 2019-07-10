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
    @japan = Japan.find(params[:id])
  end

  def image_load
    @all_car = Japan.all
    
    moi = Japan.last
    @numcar_serch = moi.numcar
    @fotoo = ImgCar.new.perform(@numcar_serch)
    puts @fotoo 

    moi.update!(foto: @fotoo)
  end

  def load
    @bmw = Japan.all
    @bmw_size = @bmw.size

    @oi = 0
    @bmw.each do |f|
      if f.foto == nil
        @oi += 1
      end
    end

  end

  def bmw
    
    testi = JapCar.new
    @liens = testi.perform
    @liens

    @existant = []
    voiture_deja = Japan.all

    voiture_deja.each do |f|
      @existant << f.numcar
    end

    @new_car = []
    @new_car = @liens - @existant 
    @new_car.each do |f| 
     Japan.create!(numcar: f, model: "bmw")    
    end

    puts @liens.size
    puts @existant.size
    puts @new_car.size
  
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
