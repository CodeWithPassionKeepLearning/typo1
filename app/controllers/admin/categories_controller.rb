class Admin::CategoriesController < Admin::BaseController
  cache_sweeper :blog_sweeper

  def index
    redirect_to :action => 'new'
  end

  def edit
    if params[:id].nil?
      new
    elsif request.post?
      update 
    else
      render_edit
    end
  end

  def new
    respond_to do |format|
      format.html { new_helper }
      format.js { @category = Category.new }
    end
  end

  def destroy
    @record = Category.find(params[:id])
    return(render 'admin/shared/destroy') unless request.post?

    @record.destroy
    redirect_to :action => 'new'
  end

  private

  def render_new
    @categories = Category.find(:all)
    @category = Category.new
    render 'new'
  end

  def create 
    @categories = Category.find(:all)
    @category = Category.new(params[:category])
    save 
    return
  end

  def new_helper
    if request.post?
      create 
    else
      render_new
    end
  end

  def render_edit
    @categories = Category.find(:all)
    @category = Category.find(params[:id])
    render 'new'
  end
  
  def update
    @categories = Category.find(:all)
    @category = Category.find(params[:id])
    @category.attributes = params[:category]
    save 
    return
  end 

  def save 
    respond_to do |format|
      format.html { save_category }
      format.js { js_save_category } 
    end
  end

  def js_save_category
    @category.save
    @article = Article.new
    @article.categories << @category
    return render(:partial => 'admin/content/categories')
  end

  def save_category
    if @category.save!
      flash[:notice] = _('Category was successfully saved.')
    else
      flash[:error] = _('Category could not be saved.')
    end
    redirect_to :action => 'new'
  end

end