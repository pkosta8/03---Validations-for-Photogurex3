class PicturesController < ApplicationController

  def index
    @pictures = Picture.all
  end



  def show
   @picture = Picture.find(params[:id])
  end




  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new
    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]
    if @picture.save

        # if the picture gets saved, generate a get request to "/pictures" (the index)
        redirect_to "/pictures"
      else
        # or reload new.html.erb
          # flash.now[:alert] = @Pictures.errors.full_messages
          flash.now[:alert] = ["ensure you fill in the correct info!"]
        render :new
      end
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to "/pictures"
  end


  def edit
    @picture = Picture.find(params[:id])
  end

  def update
    @picture = Picture.find(params[:id])
    @picture.title = params[:picture][:title]
    @picture.artist = params[:picture][:artist]
    @picture.url = params[:picture][:url]

  if @picture.save
    redirect_to "/pictures/#{@picture.id}"
  else
    render :edit
    end
  end
end
