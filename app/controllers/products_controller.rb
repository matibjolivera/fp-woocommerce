class ProductsController < WooCommerceController
  PRODUCTS_RESOURCE = "products/"

  def index
    resource = PRODUCTS_RESOURCE
    @result = get(resource, get_url_params)
    render "index"
  end
end