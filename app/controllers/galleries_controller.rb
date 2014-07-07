class GalleriesController < ApplicationController
before_action :require_login

  def index
    @galleries = Gallery.all #gallery.all retrieves record from database and is set to an instance variable 
  end

  def destroy
    gallery = Gallery.find(params[:id])#@ sign not neccessary because not being passed anywhere
    gallery.destroy
    redirect_to galleries_path # this was the original redirect, now using path helpers see notes"/galleries"
  end

  def new
    @gallery = Gallery.new #used for form_for(in new.html.erb) to pass in activerecord object. determines which url form should submit to

  end

 def edit
    @gallery = Gallery.find(params[:id])
 end

  def create
    params_with_user_id = gallery_params.merge(
      user_id: current_user.id)
    @gallery = Gallery.new(params_with_user_id)
    if @gallery.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def update
    #have to use instance variables to the new.html.erb can read the variable!
    @gallery = Gallery.find(params[:id])
    #gallery.update(gallery_params)#see private method
    if @gallery.update(gallery_params)
      redirect_to gallery #using helper method path instead"/galleries/#{gallery.id}"
    else
      render :edit
    end
  end

  def show
    @gallery = Gallery.find(params[:id])
    @images = @gallery.images
  end

  private

  def gallery_params
    params.require(:gallery).#can go to new line with period here
    permit(:name, :description)
  end
end
