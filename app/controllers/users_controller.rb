class UsersController < ApplicationController
  def show
  	@user = User.find(param[:id])
  	@posts = user.posts
  end
end