class GreenhousesController < ApplicationController
  before_action :set_greenhouse, only: %i[ show edit update destroy ]
  before_action :set_q, only: [:index, :search]
  # GET /greenhouses or /greenhouses.json
  def index
    @greenhouses = Greenhouse.all
  end

  # GET /greenhouses/1 or /greenhouses/1.json
  def show
  end

  # GET /greenhouses/new
  def new
    @greenhouse = Greenhouse.new
  end

  # GET /greenhouses/1/edit
  def edit
  end

  # POST /greenhouses or /greenhouses.json
  def create
    @greenhouse = Greenhouse.new(greenhouse_params)
    @greenhouse.user_id = current_user.id
    respond_to do |format|
      if @greenhouse.save
        format.html { redirect_to @greenhouse, notice: "新しく登録しました" }
        format.json { render :show, status: :created, location: @greenhouse }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @greenhouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /greenhouses/1 or /greenhouses/1.json
  def update
    respond_to do |format|
      if @greenhouse.update(greenhouse_params)
        format.html { redirect_to @greenhouse, notice: "更新しました" }
        format.json { render :show, status: :ok, location: @greenhouse }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @greenhouse.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /greenhouses/1 or /greenhouses/1.json
  def destroy
    @greenhouse.destroy
    respond_to do |format|
      format.html { redirect_to greenhouses_url, notice: "削除しました" }
      format.json { head :no_content }
    end
  end
  
  def search
    @results = @q.result
  end
  
  def set_q
    @q = Greenhouse.ransack(params[:q])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_greenhouse
      @greenhouse = Greenhouse.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def greenhouse_params
      params.require(:greenhouse).permit(:name, :introduction, :price, :address, :image)
    end
end
