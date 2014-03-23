class BankCardTypesController < ApplicationController
  before_action :set_bank_card_type, only: [:show, :edit, :update, :destroy]

  # GET /bank_card_types
  # GET /bank_card_types.json
  def index
    @bank_card_types = BankCardType.all
  end

  # GET /bank_card_types/1
  # GET /bank_card_types/1.json
  def show
  end

  # GET /bank_card_types/new
  def new
    @bank_card_type = BankCardType.new
  end

  # GET /bank_card_types/1/edit
  def edit
  end

  # POST /bank_card_types
  # POST /bank_card_types.json
  def create
    @bank_card_type = BankCardType.new(bank_card_type_params)

    respond_to do |format|
      if @bank_card_type.save
        format.html { redirect_to @bank_card_type, notice: 'Bank card type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bank_card_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @bank_card_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_card_types/1
  # PATCH/PUT /bank_card_types/1.json
  def update
    respond_to do |format|
      if @bank_card_type.update(bank_card_type_params)
        format.html { redirect_to @bank_card_type, notice: 'Bank card type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bank_card_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_card_types/1
  # DELETE /bank_card_types/1.json
  def destroy
    @bank_card_type.destroy
    respond_to do |format|
      format.html { redirect_to bank_card_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_card_type
      @bank_card_type = BankCardType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_card_type_params
      params.require(:bank_card_type).permit(:name)
    end
end
