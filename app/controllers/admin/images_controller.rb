class Admin::ImagesController < Admin::BaseController
  before_action :set_image,    only: [:edit, :update, :destroy]
  before_action :order_images, only: [:index]

  def index
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    @image.save ? redirect_to(admin_images_path) : render(:new)
  end

  def edit
  end

  def update
    @image.save ? redirect_to(admin_images_path) : render(:edit)
  end

  def destroy
    @image.delete; redirect_to admin_images_path
  end

  private

  def order_images
    @images = Image.order('created_at')
  end

  def set_image
    @image = Image.find(params[:id])
  end

  def image_params
    params.require(:image).permit(:image)
  end
end