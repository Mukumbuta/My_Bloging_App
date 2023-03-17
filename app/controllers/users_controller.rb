class UsersController < ApplicationController
  def index
    @users = 'This is a list of all users'
  end

  def show
    @user = "These are the details of only one user whose id is #{params[:id]}"
  end
end
