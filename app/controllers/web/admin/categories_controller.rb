class Web::Admin::CategoriesController < Web::Admin::ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)

    if @category.save
      redirect_to admin_categories_path, flash: { info: t('messages.category_created') }
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])

    if @category.update(post_params)
      redirect_to admin_categories_path, flash: { info: t('messages.category_updated') }
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.find(params[:id])

    if @category.destroy
      redirect_to admin_categories_path, status: :see_other, flash: { info: t('messages.category_deleted') }
    else
      redirect_to admin_categories_path, flash: { info: t('messages.category_not_deleted') }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end
end
