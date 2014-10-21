class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

 def index
   if params[:tag]
      @pins = Pin.tagged_with(params[:tag])
    else
      @pins = Pin.all.order("created_at DESC")
    end
 end

 def rings
   if params[:tags]
      @pins = Pin.tagged_with("rings", :any => true )
    else
      @pins = Pin.tagged_with("rings", :any => true ).order("created_at DESC")
    end
 end

  def fashion
   if params[:tags]
      @pins = Pin.tagged_with("Jewelry", :any => true )
    else
      @pins = Pin.tagged_with("Jewelry", :any => true ).order("created_at DESC")
    end
  end

  def pearls
   if params[:tags]
      @pins = Pin.tagged_with("pearls", :any => true )
    else
      @pins = Pin.tagged_with("pearls", :any => true ).order("created_at DESC")
    end
  end

  def gold
   if params[:tags]
      @pins = Pin.tagged_with("gold", :any => true )
    else
      @pins = Pin.tagged_with("gold", :any => true ).order("created_at DESC")
    end
  end

  def childs
   if params[:tags]
      @pins = Pin.tagged_with("Children's Jewelry", :any => true )
    else
      @pins = Pin.tagged_with("Children's Jewelry", :any => true ).order("created_at DESC")
    end
  end

  def custom
   if params[:tags]
      @pins = Pin.tagged_with("Yan Djap's Custom", :any => true )
    else
      @pins = Pin.tagged_with("Yan Djap's Custom", :any => true ).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def edit
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, notice: 'Image was successfully created.'
    else
      render action: 'new'
    end
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, notice: 'Image was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @pin.destroy
    redirect_to pins_url
  end

  def tagged
    if params[:tag].present? 
      @pins = Pin.tagged_with(params[:tag])
    else 
      @pins = Pin.postall
    end  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit this photo" if @pin.nil?
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:description, :image, :tag_list)
    end
end