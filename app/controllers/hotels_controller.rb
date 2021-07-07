class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /hotels or /hotels.json
  def index
    @hotels = Hotel.all
  end

  # GET /hotels/1 or /hotels/1.json
  def show
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
    @hotel = current_user.hotels.build
  end

  # GET /hotels/1/edit
  def edit
  end

  # POST /hotels or /hotels.json
  def create
    #@hotel = Hotel.new(hotel_params)
    @hotel = current_user.hotels.build(hotel_params)
    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: "Hotel was successfully created." }
        format.json { render :show, status: :created, location: @hotel }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  def correct_user
    @hotel = current_user.hotels.find_by(id: params[:id])
    redirect_to hotels_path, notice: "Not Authorized" if @hotel.nil?
  end

  # PATCH/PUT /hotels/1 or /hotels/1.json
  def update
    respond_to do |format|
      if @hotel.update(hotel_params)
        format.html { redirect_to @hotel, notice: "Hotel was successfully updated." }
        format.json { render :show, status: :ok, location: @hotel }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @hotel.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hotels/1 or /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url, notice: "Hotel was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(:name, :location, :phone, :website, :user_id)
    end
end
