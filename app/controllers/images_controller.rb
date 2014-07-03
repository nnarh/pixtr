class ImagesController < ApplicationController
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new 
  end

  def create
    #have to use instance variables to the new.html.erb can read the variable!
    @gallery = Gallery.find(params[:gallery_id])
    @image = @gallery.images.new(image_params)
    
    if @image.save
      redirect_to @gallery
    else
      render :new
    end

  end

  def edit
    @gallery = find_gallery#Gallery.find(params[:gallery_id])
    @image = find_image_in(@gallery)#Image.find(params[:id])
  end

  #def update
    #image = Image.find(params[:id])
   # image.update
  #end

  def update
    @gallery = find_gallery#gallery = Gallery.find(params[:id])
    @image = find_image_in(gallery)#gallery.update(image_params)#see private method
    if @image.update(image_params)
      redirect_to @gallery
    else
      render :edit
    end #using helper method path instead"/galleries/#{gallery.id}"
  end

  def destroy
    image = Image.find(params[:id])
    image.destroy
    redirect_to galleries_path # this was the original redirect, now using path helpers see notes"/galleries"
  end

  def show
    @gallery = find_gallery
    @image = find_image_in(@gallery)
  end

  private 

  def find_image_in(gallery)
    gallery.images.find(params[:id])
  end

  def find_gallery
    gallery = Gallery.find(params[:gallery_id])
  end

  def image_params
    params.require(:image).#can go to new line with period here
    permit(:name, :description, :url)
  end
end