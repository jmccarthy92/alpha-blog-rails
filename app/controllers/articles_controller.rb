class ArticlesController < ApplicationController
  #  runs the set_article method before the following actions
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  
  def index
    # loads default items which is 20 if per_page is not specified
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new
  end
  
  def edit
   
  end
  
  def create
    # to use byebug debugger
    # debugger 
    @article = Article.new(article_params)
    # @article.user = User.first
    if @article.save
      flash[:success] = "Article was successfully created"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def update
   
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def show
   
  end
  
  def destroy
    
    @article.destroy
    flash[:danger] = "Article was successfully deleted"
    redirect_to articles_path
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end
    
    def article_params
      params.require(:article).permit(:title, :description)
    end
  
end

