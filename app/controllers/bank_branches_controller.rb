class BankBranchesController < ApplicationController
  before_action :set_bank_branch, only: [:show, :edit, :update, :destroy]

  # GET /bank_branches
  # GET /bank_branches.json
  def index
    @bank_branches = BankBranch.all
  end

  # GET /bank_branches/1
  # GET /bank_branches/1.json
  def show
  end

  # GET /bank_branches/new
  def new
    @bank_branch = BankBranch.new
  end

  # GET /bank_branches/1/edit
  def edit
  end

  # POST /bank_branches
  # POST /bank_branches.json
  def create
    @bank_branch = BankBranch.new(bank_branch_params)

    respond_to do |format|
      if @bank_branch.save
        format.html { redirect_to @bank_branch, notice: 'Bank branch was successfully created.' }
        format.json { render action: 'show', status: :created, location: @bank_branch }
      else
        format.html { render action: 'new' }
        format.json { render json: @bank_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bank_branches/1
  # PATCH/PUT /bank_branches/1.json
  def update
    respond_to do |format|
      if @bank_branch.update(bank_branch_params)
        format.html { redirect_to @bank_branch, notice: 'Bank branch was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @bank_branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bank_branches/1
  # DELETE /bank_branches/1.json
  def destroy
    @bank_branch.destroy
    respond_to do |format|
      format.html { redirect_to bank_branches_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bank_branch
      @bank_branch = BankBranch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bank_branch_params
      params.require(:bank_branch).permit(:name)
    end
end
