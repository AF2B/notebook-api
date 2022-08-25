class AddressSerializer < ActiveModel::Serializer
  attributes :id, :street, :city

  belongs_to :contact do
    link(:related) { v1_contact_address_url(object.contact) }
  end

  # belongs_to :kind do
  #   link(:related) { v2_contact_address_url(object.contact) }
  # end
end
