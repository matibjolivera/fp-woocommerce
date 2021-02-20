class Order
	include Mongoid::Document
	include Mongoid::Timestamps

	field :reference, type: String

  #embeds_one :billing
  #embeds_one :shipping
end