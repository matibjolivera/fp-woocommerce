class OrdersController < WooCommerceController
  ORDERS_RESOURCE = "orders/"

  def index
    resource = ORDERS_RESOURCE
    @result = get(resource, get_url_params)
    render "index"
  end
end
