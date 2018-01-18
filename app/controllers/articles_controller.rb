class ArticlesController < ApplicationController
  
  def new
    @article = Article.new
  end
  
  def create
#    記事をデータベースに保存
    @article = Article.new(article_params)
    
#    articleモデルのバリデーションに引っかかる時の処理
    if @article.save
#    ユーザーをshowアクションにリダイレクト
      redirect_to @article
    else
#      ビューのnewテンプレートが描画されたときに、@articleオブジェクトがビューのnewテンプレートに返されるようにする
      render 'new'
    end
    
#    render plain: params[:article].inspect
  end
  
  def show
#    取り出したい記事をデータベースから探す
    @article = Article.find(params[:id])
  end
  
  def index
#    記事一覧をデータベースから取得
    @articles = Article.all
  end
  
#  strong_parameters設定のためのメソッド
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
    
end
