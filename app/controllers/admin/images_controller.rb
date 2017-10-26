class Admin::ImagesController < Admin::BaseController

  def new
    @image = Image.new
  end
end