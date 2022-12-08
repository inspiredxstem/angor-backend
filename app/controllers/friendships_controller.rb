class FriendshipsController < ApplicationController
	skip_before_action :authorize
    def index
        @friends = current_user.friends
        render json: @friends, status: :ok
    end

    def create
        @friendship = Friendship.create(user_id: params[:user_id], friend_id: params[:friend_id])
        render json: @friendship, status: :created
    end

    def update
        @friend = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
        @friend.update(status: true)
        render json: @friend, status: :accepted
    end

    def destroy
        @friend = Friendship.find_by(user_id: current_user, friend_id: params[:friend_id])
        @friend.destroy
        head :no_content
    end
end
