class PhotosController < ApplicationController
  before_action :set_photo, :only => [:show, :edit, :update, :destroy]
  
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
    if @photo.save
      redirect_to photos_url
    else
      render :action => :new
    end
  end

  def update
    if @photo.update_attributes(photo_params)
      redirect_to photo_path(@photo)
    else
      render :action => :edit
    end
  end

  def destroy
    @photo.destroy

    redirect_to photos_url
  end

  private

  # 透過 params 取得表單來的資料
  def photo_params
    params.require(:photo).permit(:photo_name, :date, :description, :file_location, :tag)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end

end
