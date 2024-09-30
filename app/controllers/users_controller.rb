class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find([:id])
  end
end
