class Admin::GalleriesController < Admin::BaseController
  def index
    @galleries = Gallery.all
  end

  def new
    @gallery = Gallery.new
  end

  def create
    gallery = Gallery.new(permitted_params)
    redirect_to admin_galleries_path if gallery.save!
  end

  def destroy
    Gallery.find(params[:id]).destroy
    redirect_to admin_galleries_path
  end

  private

  def permitted_params
    params.require(:gallery).permit(:id, :title, :user_id, entities: [])
  end
end
