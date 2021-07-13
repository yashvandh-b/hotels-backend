class BranchesController < ApplicationController

    before_action :set_branch, only: [ :edit, :update, :destroy]
    
    def new
        @branch = Branch.new
    end

    def index
        @branches = Branch.where(hotel_id: params[:hotel_id])
    end
    
    def edit
    end

    def create
        @branch = Branch.new(branch_params)
        respond_to do |format|
            if @branch.save
                format.html { redirect_to @branch, notice: "Branch was successfully created." }
            else
                format.html { render :new, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @branch.destroy
        respond_to do |format|
            format.html { redirect_to root_path, notice: "Branch was successfully destroyed." }
        end
    end

    private
    def set_branch
        @branch = Branch.find(params[:id])
    end

    def branch_params
        params.require(:branch).permit(:name, :location, :manager_name, :manager_phone, :hotel_id)
    end

end