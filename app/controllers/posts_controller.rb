class PostsController < ApplicationController
  before_action :connected_user, only: [:create, :new]
end
