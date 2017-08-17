class BeneficesController < ApplicationController
  before_action :set_benefice, only: [:show, :edit, :update, :destroy]

  # GET /benefices
  # GET /benefices.json
  def index
    @benefices = Benefice.all
  end

  # GET /benefices/1
  # GET /benefices/1.json
  def show
  end

  # GET /benefices/new
  def new
    @benefice = Benefice.new
  end

  # GET /benefices/1/edit
  def edit
  end

  # POST /benefices
  # POST /benefices.json
  def create
    @benefice = Benefice.new(benefice_params)

    respond_to do |format|
      if @benefice.save
        format.html { redirect_to @benefice, notice: 'Benefice was successfully created.' }
        format.json { render :show, status: :created, location: @benefice }
      else
        format.html { render :new }
        format.json { render json: @benefice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /benefices/1
  # PATCH/PUT /benefices/1.json
  def update
    respond_to do |format|
      if @benefice.update(benefice_params)
        format.html { redirect_to @benefice, notice: 'Benefice was successfully updated.' }
        format.json { render :show, status: :ok, location: @benefice }
      else
        format.html { render :edit }
        format.json { render json: @benefice.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /benefices/1
  # DELETE /benefices/1.json
  def destroy
    @benefice.destroy
    respond_to do |format|
      format.html { redirect_to benefices_url, notice: 'Benefice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_benefice
      @benefice = Benefice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def benefice_params
      params.require(:benefice).permit(:estado, :fecha_vencimiento)
    end
end
