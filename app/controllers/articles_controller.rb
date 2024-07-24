class ArticlesController < ApplicationController
    #初期表示
    def index
        @articles = Article.all
    end
  
    #検索
    def show
        @article = Article.find(params[:id])
    end
  
    #新規作成画面表示
    def new
        @article = Article.new
    end
  
    #新規作成
    def create
        @article = Article.new(article_params)
  
        if @article.save
            redirect_to @article
        else
            #保存失敗時 errorCode422を返却
            render :new, status: :unprocessable_entity
        end
    end
  
    #更新画面表示
    def edit
        @article = Article.find(params[:id])
    end
    
    #更新
    def update
        @article = Article.find(params[:id])
    
        if @article.update(article_params)
            redirect_to @article
        else
            #保存失敗時 errorCode422を返却
            render :edit, status: :unprocessable_entity
        end
    end

    #削除
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
    
        redirect_to root_path, status: :see_other
    end

    #StrongParameterでparamsをフィルタ
    private
      def article_params
        params.require(:article).permit(:title, :body)
      end
  end
