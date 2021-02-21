class Order
  include Mongoid::Document
  include Mongoid::Timestamps

  field :reference, type: String

  embeds_one :billing
  embeds_one :shipping

  index({ reference: 1 }, { unique: true })
end