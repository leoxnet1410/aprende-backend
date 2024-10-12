class PublicationsController < ApplicationController
  before_action :set_category, only: [:by_category]
  before_action :set_publication, only: [:show]

  def by_category
    @category = Category.find_by(name: params[:category_name])
    if @category.nil?
      render json: { error: 'Categoría no encontrada' }, status: :not_found
    else
      @publications = @category.publications

      if @publications.empty?
        render json: { message: 'No hay publicaciones en esta categoría' }, status: :ok
      else
        render json: @publications.as_json(methods: [:image_url]), status: :ok
      end
    end
  end

  def show
    render json: @publication.as_json(methods: [:image_url]), status: :ok
  end

  def create
    @publication = Publication.new(publication_params)
    if @publication.save
      render json: @publication.as_json(methods: [:image_url]), status: :created
    else
      render json: { errors: @publication.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def set_category
    @category = Category.find_by(name: params[:category_name])
  end

  def set_publication
    @publication = Publication.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Publicación no encontrada' }, status: :not_found
  end

  def publication_params
    params.require(:publication).permit(:name, :description, :price, :location, :category_id, :image)
  end
end