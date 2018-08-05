class PostsController < ApplicationController
  

  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_post, only: [:destroy]
  before_action :authorize_user, only: [:destroy]
  # respond_to :html, :js

  def home
  	@post = Post.new
  	@posts = Post.all
  	@comment = Comment.new
  	
  end

  def create
  	@post = Post.create(content: params[:post][:content], user_id: current_user.id)
  	redirect_to action: 'home'
    # commenting out as we want create function to go to create.js.erb
  end

  def destroy
   @x.destroy

  	redirect_to action: 'home'
  end


   private

   def set_post
   	@x = Post.find(params[:id])
   end

   def authorize_user
   	if current_user.id != @x.user_id
   		redirect_to action: 'home'
   	end
  	
   end

end
