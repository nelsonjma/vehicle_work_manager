class ItemCategoriesController < ApplicationController

  helper 'table_operations/sorting'

  include TableOperations::SortingHelper

  before_action :authenticated

  before_action :set_item_category, only: [:edit, :update, :destroy]

  def index
    sort      = sort_column(:sort, :created_at)
    direction = sort_direction(:direction)

    @item_categories = ItemCategory.search(params[:search]).order("#{sort} #{direction}").paginate(:per_page => 15, :page => params[:page])
  end

  def new
    @item_category = ItemCategory.new
  end

  def edit
  end

  def create
    @item_category = ItemCategory.new(item_category_params)

    respond_to do |format|
      if @item_category.save

        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao criar nova categoria', @item_category.errors.full_messages)
      end
    end
    
  end

  def update
    respond_to do |format|
      if @item_category.update(item_category_params)
        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao actualizar categoria existente', @item_category.errors.full_messages)
      end
    end
  end

  def destroy
    respond_to do |format|
      if @item_category.stock_items.count == 0
        @item_category.destroy

        format.js   {}
      else
        generic_form_error_hander(format, 'Erro ao eliminar categoria', ['Categoria tem items, não pode ser eliminada.'])
      end
    end

    @item_category.destroy
  end

  private

    def set_item_category
      @item_category = ItemCategory.find(params[:id])
    end

    def item_category_params
      params.require(:item_category).permit(:name)
    end
end
