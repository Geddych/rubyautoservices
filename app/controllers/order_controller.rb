
class OrderController < ApplicationController
    def index
        @order = Order.all
    end
    def sorted
        @filteredOrders = Order.order(:start_date).all
        filter = params[:filter]
        case filter 
            when "date"
                @filteredOrders = Order.order(:start_date).all
            when "customer"
                @filteredOrders = Order.order(:customer).all
            when "status"
                @filteredOrders = Order.order(:status).all
            when "auto"
                @filteredOrders = Order.order(:machine).all
            when "auto_desc"
                @filteredOrders = Order.order(:machine).reverse_order.all
            when "customer_desc"
                @filteredOrders = Order.order(:customer).reverse_order.all
            when "status_desc"
                @filteredOrders = Order.order(:status).reverse_order.all
            when "date_desc"
                @filteredOrders = Order.order(:start_date).reverse_order.all
            when "status_completed"
                @filteredOrders = Order.where("status = 'Выполнен'")
            when "status_work"
                @filteredOrders = Order.where("status = 'В работе'")
            when "status_return"
                @filteredOrders = Order.where("status = 'Машина возвращена'")
            end
    end
    def show
        @order = Order.find(params[:id])
        redirect_to edit_order_url
    end
    def new
        @order = Order.new
    end
    def create
        @order = Order.new(customer: params.require(:order)[:customer],machine: params.require(:order)[:machine],reg_number: params.require(:order)[:reg_number],telephone: params.require(:order)[:telephone],status: "Принят в работу")
        if @order.save
            redirect_to @order
        else
            render "new"
        end
    end
    def edit
        @order = Order.find(params[:id])
        @list = OrderList.new
        @staff = Staff.all
        @services = Service.all
        id = (params[:id]).to_i
        @orderedList = OrderList.where(order_id: id).all
        @totalPrice = 0
        @worktime = 0
        @orderedList.each do |record|
            item = Service.find(record.service_id)
            @totalPrice += item.price
            @worktime += item.worktime
        end
    end
    def update
        @order = Order.find(params[:id])
        if @order.update(order_params)
            redirect_to order_index_url
        else
            render "edit"
        end
    end
    def exc 
        type = params[:type]
        case type
        when "zakas"
                download_zak
        when "pricelist"
                pricelist
        end
    end
    private
    def order_params
        params.require(:order).permit(:customer,:machine,:reg_number,:total_price,:telephone,:status,:start_date,:worktime)
    end
    def download_zak
        order = Order.all
        tp = 0
        wt = 0
        p = Axlsx::Package.new
        wb = p.workbook
        head_style = wb.styles.add_style bg_color: "DDDDDD",  b: true
        #---------------------------------
        wb.add_worksheet(name: "заказы") do |sheet|
        sheet.add_row %w(номер_заказа заказчик Телефон Автомобиль Время_работы Стоимость)
        sheet.row_style 0, head_style
        order.each do |o|
            sheet.add_row [o.id,o.customer,o.telephone,o.machine,o.worktime,o.total_price]
        end
        end
        #----------------------------------
        order.each do |o|
            wb.add_worksheet(name: "Заказ № "+o.id.to_s) do |sheet|
                sheet.add_row ["Закачзик: ",o.customer]
                sheet.add_row ["Дата начала: ",o.start_date]
                sheet.add_row %w(Услуга Цена Исполнитель Время_работы) 
                ol = OrderList.where(order_id: o.id).all
                ol.each do |ol|
                    servc = Service.where(id: ol.service_id).all
                    servc.each do |s|
                        staff = Staff.where(id: ol.staff_id).all
                        staff.each do |st|
                            sheet.add_row [s.title,s.price,st.name+" "+st.surname,s.worktime]
                            wt += s.worktime
                            tp += s.price
                        end   
                                      
                    end
                end 
            end
        end
        p.serialize('Выгрузка по заказам.xlsx')
        send_file "Выгрузка по заказам.xlsx"
    end
    def pricelist
        cat = Category.all
        p = Axlsx::Package.new
        wb = p.workbook
        head_style = wb.styles.add_style bg_color: "DDDDDD",  b: true
        wb.add_worksheet(name: "заказы") do |sheet|
            cat.each do |c|
                sheet.add_row [c.title]
                sheet.row_style 0, head_style
                Service.where(categories_id: c.id).all.each do |s|
                    sheet.add_row %w(Название Цена)
                    sheet.add_row [s.title,s.price]
                end
            end
            
        end
        p.serialize('Прайслист.xlsx')
        send_file "Прайслист.xlsx"
    end
    
end
