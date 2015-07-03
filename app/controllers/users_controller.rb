class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def edit
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def google_oauth2
    report = Users::Api::GoogleOauth2.run(omniauth: request.env["omniauth.auth"])

    if report.success?
      sign_in_and_redirect report.data.user
    else
      flash[:sign_in_failure] = 'invalid_hosted_domain'

      redirect_to new_user_session_path
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      allowed_params = [
        :first_name,
        :last_name,
        :birthdate,
        :mobile_number,
        :skype_name,
        :avatar
      ]

      params.require(:user).permit(allowed_params)
    end
end
