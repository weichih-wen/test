class PhotosController < ApplicationController
  
  # show all photos
  def index
    @photos = Photo.all
  end

  # add new photo
  def new
    @photo = Photo.new
  end

  # create new photo data
  def create
    @photo = Photo.new(photo_params)
    @photo.save

    redirect_to photos_url
  end

  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    @photo.update_attributes(photo_params)

    redirect_to photo_path(@photo)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

    redirect_to photos_url
  end

  private

  # 透過 params 取得表單來的資料
  def photo_params
    params.require(:photo).permit(:photo_name, :date, :description, :file_location, :tag)
  end

end
