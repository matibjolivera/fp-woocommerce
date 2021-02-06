class WooCommerceController < ApplicationController
  API_URL = 'https://footprintsclothes.com.ar/wp-json/wc/v3/'

  def get (resource, params = nil)
    uri = API_URL + resource
    unless params.nil?
      uri += "?" + params
    end

    puts "GET Request - URL: " + uri

    JSON.parse(RestClient.get(set_api_keys(uri)))
  end

  def get_url_params
    url_params = ""
    i = 0
    params.except(:controller, :action).each do |key, value|
      separator = i == 0 ? "" : "&"
      url_params += separator + key.to_s + "=" + value.to_s
      i += 1
    end
    url_params
  end

  def set_api_keys(url)
    if url[-1] == '/'
      url += "?"
    else
      url += "&"
    end
    url + "consumer_key=" + ENV['PUBLIC_API_KEY'] + "&consumer_secret=" + ENV['SECRET_API_KEY']
  end
end
