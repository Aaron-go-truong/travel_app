class AdminController < ApplicationController
  def index
    @users = User.all.where(role: 'user')
  end
end
