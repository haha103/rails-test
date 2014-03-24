class GuaranteesController < ApplicationController
  before_action :set_guarantee, only: [:show, :edit, :update, :destroy]

  # GET /guarantees
  # GET /guarantees.json
  def index
    @guarantees = Guarantee.all
  end

  # GET /guarantees/1
  # GET /guarantees/1.json
  def show
  end

  # GET /guarantees/new
  def new
    @guarantee = Guarantee.new
  end

  # GET /guarantees/1/edit
  def edit
  end

  # POST /guarantees
  # POST /guarantees.json
  def create
    @guarantee = Guarantee.new(guarantee_params)

    respond_to do |format|
      if @guarantee.save
        format.html { redirect_to @guarantee, notice: 'Guarantee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @guarantee }
      else
        format.html { render action: 'new' }
        format.json { render json: @guarantee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guarantees/1
  # PATCH/PUT /guarantees/1.json
  def update
    respond_to do |format|
      if @guarantee.update(guarantee_params)
        format.html { redirect_to @guarantee, notice: 'Guarantee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @guarantee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guarantees/1
  # DELETE /guarantees/1.json
  def destroy
    @guarantee.destroy
    respond_to do |format|
      format.html { redirect_to guarantees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guarantee
      @guarantee = Guarantee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guarantee_params
      params.require(:guarantee).permit(:letter_code, :letter_scan)
    end
end
