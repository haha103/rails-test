class SessionStatusesController < ApplicationController
  before_action :set_session_status, only: [:show, :edit, :update, :destroy]

  # GET /session_statuses
  # GET /session_statuses.json
  def index
    @session_statuses = SessionStatus.all
  end

  # GET /session_statuses/1
  # GET /session_statuses/1.json
  def show
  end

  # GET /session_statuses/new
  def new
    @session_status = SessionStatus.new
  end

  # GET /session_statuses/1/edit
  def edit
  end

  # POST /session_statuses
  # POST /session_statuses.json
  def create
    @session_status = SessionStatus.new(session_status_params)

    respond_to do |format|
      if @session_status.save
        format.html { redirect_to @session_status, notice: 'Session status was successfully created.' }
        format.json { render action: 'show', status: :created, location: @session_status }
      else
        format.html { render action: 'new' }
        format.json { render json: @session_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /session_statuses/1
  # PATCH/PUT /session_statuses/1.json
  def update
    respond_to do |format|
      if @session_status.update(session_status_params)
        format.html { redirect_to @session_status, notice: 'Session status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @session_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /session_statuses/1
  # DELETE /session_statuses/1.json
  def destroy
    @session_status.destroy
    respond_to do |format|
      format.html { redirect_to session_statuses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session_status
      @session_status = SessionStatus.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_status_params
      params.require(:session_status).permit(:code, :name)
    end
end
