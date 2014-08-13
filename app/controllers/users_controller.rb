class UsersController < ApplicationController
  def show
  	@user = User.find(param[:id])
  	@posts = users.posts
  end
end