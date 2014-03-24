class RefundTypesController < ApplicationController
  before_action :set_refund_type, only: [:show, :edit, :update, :destroy]

  # GET /refund_types
  # GET /refund_types.json
  def index
    @refund_types = RefundType.all
  end

  # GET /refund_types/1
  # GET /refund_types/1.json
  def show
  end

  # GET /refund_types/new
  def new
    @refund_type = RefundType.new
  end

  # GET /refund_types/1/edit
  def edit
  end

  # POST /refund_types
  # POST /refund_types.json
  def create
    @refund_type = RefundType.new(refund_type_params)

    respond_to do |format|
      if @refund_type.save
        format.html { redirect_to @refund_type, notice: 'Refund type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @refund_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @refund_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /refund_types/1
  # PATCH/PUT /refund_types/1.json
  def update
    respond_to do |format|
      if @refund_type.update(refund_type_params)
        format.html { redirect_to @refund_type, notice: 'Refund type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @refund_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /refund_types/1
  # DELETE /refund_types/1.json
  def destroy
    @refund_type.destroy
    respond_to do |format|
      format.html { redirect_to refund_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_refund_type
      @refund_type = RefundType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def refund_type_params
      params.require(:refund_type).permit(:name)
    end
end
