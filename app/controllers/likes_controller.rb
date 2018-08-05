class LikesController < ApplicationController
  
  before_action :authenticate_user!


  def toggle
  	@post = Post.find(params[:post_id])

  	if @post.user_can_like(current_user.id)
  		# byebug  
  	    @like = @post.likes.build(user_id: current_user.id)
        @like.save
    else
  		# Like.find_by(user_id: current_user.id, post_id: params[:post_id]).destroy
     Like.find_by(user_id: current_user.id, likeable_id: params[:post_id]).destroy
  	end
  	
  	redirect_to root_path	
  end


  def toggle1
    @comment = Comment.find(params[:comment_id])

    if @comment.user_can_like(current_user.id)
      # Like.create(user_id: current_user.id, post_id: params[:post_id])
        @like = @comment.likes.build(user_id: current_user.id)
        @like.save
    else
      # Like.find_by(user_id: current_user.id, comment_id: params[:comment_id]).destroy
      Like.find_by(user_id: current_user.id, likeable_id: params[:comment_id]).destroy
    end
    
    redirect_to root_path 
  end
  
end