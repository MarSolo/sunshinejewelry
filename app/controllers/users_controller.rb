class UsersController < ApplicationController
  def show
  	@user = User.find(param[:id])
  	@posts = users.posts
  	@pins = users.pins
  end
end