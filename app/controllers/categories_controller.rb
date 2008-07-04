class CategoriesController < ApplicationController

  before_filter :load_variables
  before_filter :authenticate, :except => {'index', 'show'}
  after_filter :erase_flash

  def index; @category = Category.find_by_name('Accueil') || Category.new; end
  def show; end
  def new; render :partial => 'form', :layout => 'categories';  end
  def edit;  render :partial => 'form', :layout => 'categories';  end

  def create
    @category = Category.new(params[:category])
    @category.save
    redirect_to category_path(@category)
  end
  def update
    Category.find(params[:id]).update_attributes(params[:category])
    flash[:now] = "Catégorie #{params[:category][:name]} mise à jour"
    redirect_to category_path(params[:id])
  end
  def destroy
    Category.find(params[:id]).destroy
    redirect_to categories_path
  end

private
  def load_variables
    @category = params[:id] ? Category.find(params[:id]) : Category.new
    @categories = Category.find :all
  end
  def erase_flash
    flash[:now] = nil
  end
end
