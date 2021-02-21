module Address
  extend ActiveSupport::Concern
  include Mongoid::Extensions::Hash::IndifferentAccess

  included do
    field :first_name, type: String
    field :last_name, type: String
    field :email, type: String
    field :province, type: String
    field :city, type: String
    field :street, type: String
    field :extra_information, type: String
    field :phone, type: String
    field :zip_code, type: String
  end
end
