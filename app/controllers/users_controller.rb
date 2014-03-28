# -*- coding: utf-8 -*-
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
	before_action :init
	
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
		1.times { @user.emails.build }
		1.times { @user.phones.build }
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create

		@user = User.new(user_params)
		# encrypt as early as possible
		@user.login_pass = BCrypt::Password.create(params[:user][:login_pass])
		
    respond_to do |format|
      if verify_recaptcha(:model => @user, :message => "验证码输入错误") && @user.save
        format.html { redirect_to @user, notice: '新用户创建成功' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
		
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

	def exists
		user = params[:user]
		result = "false"
		if user
			result = "true" if User.where("user_name = ? OR name = ? OR id_num = ?", user[:user_name], user[:name], user[:id_num]).length > 0
		end		
		render json: "{ \"result\": #{result} }"
	end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:user_name,
																	 :name,
																	 :id_num,
																	 #:login_pass, 
																	 emails_attributes: [:id, :addr],
																	 phones_attributes: [:id, :number])
    end

		def init
			@user_create_phases = [ "账户注册", "邮箱绑定", "银行卡绑定", "注册完成" ]
		end
end
