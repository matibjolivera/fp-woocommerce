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
    field :number, type: String
    field :floor, type: String
    field :door, type: String
    field :extra_information, type: String
    field :phone, type: String
    field :zip_code, type: String
    field :document_type, type: String
    field :document_number, type: String
  end
end
