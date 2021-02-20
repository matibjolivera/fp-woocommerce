class OrdersController < WooCommerceController
  ORDERS_RESOURCE = "orders/"

  def index
    @result = get_orders
    render "index"
  end

  def get_orders
    resource = ORDERS_RESOURCE
    get(resource, get_url_params)
  end

  def save
    orders = get_orders
    orders.each do |order|
      puts order["id"]
    end
  end
end
