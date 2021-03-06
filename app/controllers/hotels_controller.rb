class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[ show edit update destroy]
  skip_before_action :verify_authenticity_token

  # GET /hotels or /hotels.json
  def index
    #@queried_hotels = Hotel.page params[:page]
    @hotels = Hotel.all.order(created_at: :desc)
    @hotels = pagy_custom(@hotels)
    render json: @hotels, only: [:id, :name, :phone, :email, :user_id]
  end

  # GET /hotels/1 or /hotels/1.json
  def show
    render json: @hotel, only: [:id, :name, :phone, :email, :user_id]
  end

  def adminindex
    #@adminhotel = Hotel.where(user_id: current_user.id)
    @adminhotel = Hotel.where(user_id: current_user.id).page params[:page]
  end

  # GET /hotels/new
  def new
    @hotel = Hotel.new
    #@hotel = current_user.hotels.build
  end

  # POST /hotels or /hotels.json
  def create
    @hotel = Hotel.new(hotel_params)
    #@hotel = current_user.hotels.build(hotel_params)
    respond_to do |format|
      if @hotel.save
        format.html { redirect_to @hotel, notice: "Hotel was successfully created." }
        format.json { render json: @hotel, status: :ok }
      else
        format.json { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hotels/1 or /hotels/1.json
  def update
      respond_to do |format|
        if @hotel.update(hotel_params)
          format.html { redirect_to @hotel, notice: "Hotel was successfully updated." }
          format.json {render json: @hotel, status: :ok}
        else
          format.json { render :edit, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /hotels/1 or /hotels/1.json
  def destroy
    @hotel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
    end

    # Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(:id, :name, :phone, :email, :user_id)
    end

end
