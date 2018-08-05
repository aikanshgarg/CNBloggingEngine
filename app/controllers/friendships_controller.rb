class FriendshipsController < ApplicationController
  
   def create
  # when current_user(from devise) clicks on link_to "Add Friend", it's user_id comes into params[:friend_id] and an object @friendship is made which saves the changes
  	@friendship = current_user.friendships.build(friend_id: params[:friend_id])
  	if @friendship.save
  		flash[:notice] = "You're officially friends, now!"
  		redirect_to root_url
  	# why this????????????????????????????????????????????????????????????????
  	else
  		flash[:error] = "Oops, unable to add friend!"
  		redirect_to root_url
  	end
  end

  def destroy
  	# finds the user_id from current_user's friendships model, i.e, friends' list and destroys/deletes the friendship on clicking link_to "Unfriend" 
  	current_user.friendships.find(params[:id]).destroy
  	flash[:notice] = "User removed from your friends' list!"

  	redirect_to root_url
  end


end
