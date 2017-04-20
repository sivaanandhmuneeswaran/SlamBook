class UsersController < ApplicationController
    before_action :set_user

    def books
        @books = @user.books.all.order('created_at DESC')
    end
    def update_avatar
        current_user.avatar = params[:avatar]
        if current_user.avatar.blank?
            current_user.errors.add(:avatar, 'must be selected')
        else
            current_user.save
            flash[:success] = 'Avatar updated successfully'
        end 
        respond_to do | format | 
            format.js
        end
    end
    def remove_avatar
         current_user.avatar = nil
         current_user.save
         flash[:success] = 'Avatar removed successfully'
         respond_to do | format | 
            format.js
         end
    end

private
    def set_user
        @user = User.find(params[:user_id])
    end
end