class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[create update destroy]

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
          create_comment_notification(@comment, current_user)
          flash[:notice] = "コメントしました"
        else
          flash[:alert] = "コメントできませんでした"
        end
        redirect_to request.referer || root_path, status: :see_other
    end

    def update
        @comment = current_user.comments.find(params[:id])
        @comment.update(edit_params)
    end

    def destroy
        @comment = current_user.comments.find(params[:id])
        @comment.destroy!
    end

    private

    def create_comment_notification(comment, user)
      return if user.id == comment.game_log.user_id
      Notification.create(
        sender_id: user.id,
        receiver_id: comment.game_log.user_id,
        notifiable: comment
      )
    end

    def comment_params
      params.require(:comment).permit(:body).merge(game_log_id: params[:game_log_id])
    end

    def edit_params
      params.require(:comment).permit(:body)
    end
end
