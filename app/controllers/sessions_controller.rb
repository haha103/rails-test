# -*- coding: utf-8 -*-
class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
		@session = Session.new
		@session.client_ip = request.remote_ip
		@session.session_operation = SessionOperation.find_by(:name_en => "create")
		user = User.find_by(:user_name => session_params[:user_name])
		redirect_to "/sessions/new", notice: "用户不存在" unless user
		if (BCrypt::Password.new(user.login_pass) == session_params[:login_pass])
			@session.session_status = SessionStatus.find_by(:code => "200")
			@session.save
			redirect_to "/users/#{user.id}"
		else
			@session.session_status = SessionStatus.find_by(:code => "402")
			@session.save
			redirect_to "/sessions/new", notice: "密码错误"
		end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:user_name, :login_pass)
    end
end
