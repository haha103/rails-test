class SessionOperationsController < ApplicationController
  before_action :set_session_operation, only: [:show, :edit, :update, :destroy]

  # GET /session_operations
  # GET /session_operations.json
  def index
    @session_operations = SessionOperation.all
  end

  # GET /session_operations/1
  # GET /session_operations/1.json
  def show
  end

  # GET /session_operations/new
  def new
    @session_operation = SessionOperation.new
  end

  # GET /session_operations/1/edit
  def edit
  end

  # POST /session_operations
  # POST /session_operations.json
  def create
    @session_operation = SessionOperation.new(session_operation_params)

    respond_to do |format|
      if @session_operation.save
        format.html { redirect_to @session_operation, notice: 'Session operation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @session_operation }
      else
        format.html { render action: 'new' }
        format.json { render json: @session_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_operations/1
  # PATCH/PUT /session_operations/1.json
  def update
    respond_to do |format|
      if @session_operation.update(session_operation_params)
        format.html { redirect_to @session_operation, notice: 'Session operation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @session_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_operations/1
  # DELETE /session_operations/1.json
  def destroy
    @session_operation.destroy
    respond_to do |format|
      format.html { redirect_to session_operations_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_operation
      @session_operation = SessionOperation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_operation_params
      params.require(:session_operation).permit(:name, :name_en)
    end
end
