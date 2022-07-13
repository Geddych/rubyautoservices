class ServiceController < ApplicationController
    def index
        @categories = Category.all
        @services = Service.all
    end
    def new
        @service = Service.new
    end
    def create
        @service = Service.new(s_params)
        if @service.save
            redirect_to service_index_url
        else
           render "new", status: :unprocessable_entity
        end
    end
    def edit 
        @service = Service.find(params[:id])
    end
    def update
        @service = Service.find(params[:id])
        if @service.update(s_params)
            redirect_to service_index_url
        else
            render "edit"
        end
    end
    def destroy
        @service = Service.find(params[:id]).destroy

        redirect_to service_index_url
    end
private
    def s_params
        params.require(:service).permit(:title,:price,:categories_id,:worktime)
    end
end
