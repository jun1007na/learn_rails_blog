class ArticlesController < ApplicationController
  protect_from_forgery with: :exception
  before_action :basic, except: [:index, :show]
  
  def index
#    記事一覧をデータベースから取得
    @articles = Article.all
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
  
  def new
#    データベースに新規記事を作成
    @article = Article.new
  end
  
  def edit
#    取り出したい記事をデータベースから探す
    @article = Article.find(params[:id])
  end
  
  def show
#    取り出したい記事をデータベースから探す
    @article = Article.find(params[:id])
  end
  
  def update
#    取り出したい記事をデータベースから探す
    @article = Article.find(params[:id])
#    記事更新
    if @article.update(article_params)
#      モデルを保持する@articleはshowアクションへリダイレクトする
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
#    取り出したい記事をデータベースから探す
    @article = Article.find(params[:id])
#    削除
    @article.destroy
#    indexにリダイレクト
    redirect_to articles_path
  end
  
#  strong_parameters設定のためのメソッド
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
  
    def basic
      name = 'user'
      passwd = Rails.application.secrets.basic_pass
      authenticate_or_request_with_http_basic('BA') do |n, p|
        n == name && Digest::SHA1.hexdigest(p) == passwd
      end
    end
    
end
