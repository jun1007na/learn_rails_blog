class CommentsController < ApplicationController
  protect_from_forgery with: :exception
  before_action :basic, only: :destroy
  
  def create
#    記事(のオブジェクト)を取得して@articleに保存
    @article = Article.find(params[:article_id])
#    コメントの作成と保存
    @comment = @article.comments.create(comment_params)
#    元の記事の画面にリダイレクト
    redirect_to article_path(@article)
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
 
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
  
    def basic
      name = 'user'
      passwd = Rails.application.secrets.basic_pass
      authenticate_or_request_with_http_basic('BA') do |n, p|
        n == name && Digest::SHA1.hexdigest(p) == passwd
      end
    end
end
