module Admin
  class UsersController < ApplicationController

    before_action :authenticate_admin!

    def index
    end

    def new
      @user = User.new
    end

    def edit
    end

    def create
      @user = User.new(user_params)

      respond_to do |format|
        if @user.save
          redirect_to @user, notice: 'User was successfully created.'
        else
          render :new
        end
      end
    end

  end
end