class CommentsController < ApplicationController
    before_action :authenticate_user!, only: %i[create update destroy]

    def create
        @comment = Comment.new(comment_params)
        @comment.user_id = current_user.id
        if @comment.save
          flash[:notice] = "コメントしました"
        else
          flash[:alert] = "コメントできませんでした"
        end
        redirect_to request.referer || root_path
    end

    def update
        @comment = current_user.comments.find(params[:id])
        @comment.update
        redirect_to request.referer || root_path
    end

    def destroy
        @comment = current_user.comments.find(params[:id])
        @comment.destroy!
    end

    private

    def comment_params
      params.require(:comment).permit(:body).merge(game_log_id: params[:game_log_id])
    end
end
