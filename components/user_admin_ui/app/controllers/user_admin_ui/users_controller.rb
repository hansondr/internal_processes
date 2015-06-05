module UserAdminUi
  class UsersController < ApplicationController
    def index
      @users = UserData::User.all
    end

    def new
      @user = UserData::User.new
    end

    def create
      @user = UserData::User.new(user_params)

      if @user.save
        redirect_to users_url, notice: "#{user_params[:first_name]} was successfully created."
      else
        render :new
      end
    end

    def edit
      @user = UserData::User.includes(teams: [department: [:company]]).find(params[:id])
    end

    def update
      @user = UserData::User.find(params[:id])
      if @user.update(user_params)
        redirect_to users_url, notice: "#{@user.first_name} was successfully updated."
      else
        render :edit
      end
    end

    private

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email)
    end
  end
end