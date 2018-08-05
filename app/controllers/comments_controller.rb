class CommentsController < ApplicationController
  
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]
  before_action :authorize_user, only: [:destroy]

  def create
  	@new_comment = Comment.create(content: params[:comment][:content], user_id: current_user.id, post_id: params[:comment][:post_id])
    redirect_to root_path

# disable/enable less secure apps in gmail account for getting mails
    Resque.enqueue(NewCommentEmailWorker, @new_comment.id)

  end

  def destroy
  	@comment.destroy
  	redirect_to root_path
  end


   private

   def set_comment
   	@comment = Comment.find(params[:id])
   end

   def authorize_user
   	if current_user.id != @comment.user_id
   		redirect_to root_path
   	end
  	
   end



end
