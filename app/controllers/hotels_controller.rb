class HotelsController < ApplicationController
  before_action :set_hotel, only: %i[ show edit update destroy]
  skip_before_action :verify_authenticity_token

  # GET /hotels or /hotels.json
  def index
    @hotels = Hotel.page params[:page]
    render json: @hotels, only: [:id, :name, :phone, :email, :user_id]
  end

  # GET /hotels/1 or /hotels/1.json
  def show
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
        #format.html { redirect_to @hotel, notice: "Hotel was successfully created." }
        format.json {render :show, status: :ok}
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
        else
          format.html { render :edit, status: :unprocessable_entity }
        end
      end
  end

  # DELETE /hotels/1 or /hotels/1.json
  def destroy
    @hotel.destroy
    respond_to do |format|
      format.html { redirect_to hotels_url, notice: "Hotel was successfully destroyed." }
      #format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotel
      @hotel = Hotel.find(params[:id])
    rescue ActiveRecord::RecordNotFound => e
    end

    # Only allow a list of trusted parameters through.
    def hotel_params
      params.require(:hotel).permit(:name, :phone, :email, :user_id)
    end

end
