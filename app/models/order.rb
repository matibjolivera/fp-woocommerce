class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :reference, type: String
  field :saved, type: Boolean

  embeds_one :billing
  embeds_one :shipping
end