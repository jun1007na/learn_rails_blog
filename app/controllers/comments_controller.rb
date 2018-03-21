class CommentsController < ApplicationController
  def create
#    記事(のオブジェクト)を取得して@articleに保存
    @article = Article.find(params[:article_id])
#    コメントの作成と保存
    @comment = @article.comments.create(comment_params)
#    元の記事の画面にリダイレクト
    redirect_to article_path(@article)
  end
 
    private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
