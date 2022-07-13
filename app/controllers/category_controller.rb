class CategoryController < ApplicationController
    def new 
        @category = Category.new
    end
    def create
        @category = Category.new(category_params)
        if @category.save
            redirect_to service_index_path
        else
           render "new"
        end
    end
    def edit
        @category = Category.find(params[:id])
    end

    def update
        @category = Category.find(params[:id])
        if @category.update(category_params)
            redirect_to service_index_url
        else
            render "edit"
        end
    end

    def destroy
        @category = Category.find(params[:id]).destroy

        redirect_to service_index_url
    end
private
def category_params
    params.require(:category).permit(:title)
end
end
