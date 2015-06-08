module UserAdminUi
  class CompaniesController < ApplicationController
    def index
      @companies = UserData::Company.all
    end

    def new
      @company = UserData::Company.new
    end

    def create
      @company = UserData::Company.new(company_params)
      if @company.save
        redirect_to companies_path, notice: "#{@company.name} was successfully created"
      else
        render :new
      end
    end

    def edit
      @company = UserData::Company.find(params[:id])
    end

    def update
      @company = UserData::Company.find(params[:id])
      if @company.update(company_params)
        redirect_to companies_url, notice: "#{@company.name} was successfully updated."
      else
        render :edit
      end
    end

    private

    def company_params
      params.required(:company).permit(:name)
    end
  end
end