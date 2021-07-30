class BranchesController < ApplicationController

    before_action :set_branch, only: [ :edit, :update, :destroy, :show]
    skip_before_action :verify_authenticity_token
    
    def new
        @branch = Branch.new
    end

    def index
        @branches = Branch.where(hotel_id: params[:hotel_id])
        render json: @branches
    end
    
    def edit
    end

    def show
        render json: @branch, only: [:id, :name, :location, :manager_name, :manager_phone, :hotel_id]
    end

    def create
        @branch = Branch.new(branch_params)
        respond_to do |format|
            if @branch.save
                format.html { redirect_to @branch, notice: "Branch was successfully created." }
                format.json { render json: @branch, status: :ok}
            else
                format.json { render :new, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @branch.destroy
    end

    private
    def set_branch
        @branch = Branch.find(params[:id])
    end

    def branch_params
        params.require(:branch).permit(:name, :location, :manager_name, :manager_phone, :hotel_id)
    end

end