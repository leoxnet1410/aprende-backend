class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :update, :destroy]  # Corrección aquí

  def index
  @categories = Category.all
  render json: @categories.as_json(methods: [:image_url])
end

def show
  render json: @category.as_json(methods: [:image_url])
end

def create
  @category = Category.new(category_params)
  if @category.save
    render json: @category.as_json(methods: [:image_url]), status: :created
  else
    render json: @category.errors, status: :unprocessable_entity
  end
end

def update
  if @category.update(category_params)
    render json: @category.as_json(methods: [:image_url])
  else
    render json: @category.errors, status: :unprocessable_entity
  end
end

  # DELETE /categories/:id
  def destroy
    @category.destroy
    head :no_content  # Es buena práctica responder con un status 204 en caso de eliminación exitosa
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name, :image)
  end
end
