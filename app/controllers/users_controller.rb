class UsersController < ApplicationController
  def search
    @users = User.where("email LIKE ?", "%#{params[:query]}%")
  end
end
