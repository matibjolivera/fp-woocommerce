class OrdersController < WooCommerceController
  ORDERS_RESOURCE = "orders/"

  def index
    @result = Order.all
    render "index"
  end

  STATUSES_APPROVED = %w[processing completed etiqueta-generada codigo-enviado empaquetado etiqueta-impresa regenerar etiqueta-manual sin-talle talles-manual regenerada nuevo-seguimiento glovo reclamo]

  def create
    unless params[:id].present?
      raise "no ID present"
    end
    if !exist_order(params) and params[:status] == 'processing'
      new_order(params)
    end
  end

  def get_orders
    resource = ORDERS_RESOURCE
    get(resource, get_url_params)
  end

  private

  def exist_order(params)
    Order.find_by(reference: params[:id]) ? true : false
  end

  def new_order (params)
    order = Order.create!(reference: params[:id])
    order.billing = order.create_billing(build_address(params[:billing]))
    order.shipping = order.create_shipping(build_address(params[:shipping]))
  end

  def build_address(external_info)
    {
      first_name: external_info["first_name"],
      last_name: external_info["last_name"],
      email: external_info["email"],
      province: external_info["state"],
      city: external_info["city"],
      street: external_info["address_1"],
      extra_information: external_info["address_2"],
      phone: external_info["phone"],
      zip_code: external_info["postcode"]
    }
  end
end
