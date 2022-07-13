class OrderListController < ApplicationController
    def create
        @list = OrderList.new(list_params)
        if @list.save
            redirect_to edit_order_url(params.require(:order_list)[:order_id])
        else
            redirect_to edit_order_url(params.require(:order_list)[:order_id])
        end
    end
    def destroy
        @item = OrderList.find(params[:id]).destroy
        redirect_to edit_order_url(@item.order_id)
    end
private
def list_params
    params.require(:order_list).permit(:order_id,:service_id,:staff_id)
end
end
