unless Rails.env.production?
  require 'dotenv'
  Dotenv.load
end

class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    @photos = Photo.all
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
  end

  # GET /photos/new
  def new
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)

    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: 'Photo was successfully created.' }
        format.json { render action: 'show', status: :created, location: @photo }
      else
        format.html { render action: 'new' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def client_upload_complete            
      photo = Photo.new(bucket: ENV['S3_BUCKET'], s3_key: params[:key])
      if photo.save          
          redirect_to photo_path(photo)
      else
          render json: {status: "FAIL"}, status: 402
      end
  end

  def attach
    @page_photo = PagePhoto.new(photo_id: params[:photo_id].to_i, page_id: params[:page_id], order: 999)
    if @page_photo.save
      redirect_to '/photos'
    else
      redirect_to '/photos?error_saving'
    end
  end

  def detach
    @page_photo = PagePhoto.where(photo_id: params[:photo_id].to_i, page_id: params[:page_id]).first
    if @page_photo.destroy
      redirect_to '/photos'
    else
      redirect_to '/photos?error_saving'
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      params.require(:photo).permit(:iptc, :data, :caption, :byline, :sizes, :s3_key)
    end
end
