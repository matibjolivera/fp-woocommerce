class Billing
  include Mongoid::Document
  include Mongoid::Timestamps
  include Address

  embedded_in :order
end