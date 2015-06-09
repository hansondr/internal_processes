module UserAdminUi
  class DepartmentsController < ApplicationController
    def index
      @companies = UserData::Company.includes(:departments).order(name: :asc)
    end

    def new
      @department = UserData::Department.new
      @companies = UserData::Company.all
    end

    def create
      @department = UserData::Department.new(department_params)
      if @department.save
        redirect_to departments_path, notice: "#{@department.name} was successfully created."
      else
        render :new
      end
    end

    def edit
      @department = UserData::Department.find(params[:id])
      @companies = UserData::Company.all
    end

    def update
      @department = UserData::Department.find(params[:id])
      if @department.update(department_params)
        redirect_to departments_url, notice: "#{@department.name} was successfully updated."
      else
        render :edit
      end
    end

    private

    def department_params
      params.require(:department).permit(:name, :company_id)
    end
  end
end