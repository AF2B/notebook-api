class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { v1_contact_kind_url(object.id) }
  end
  has_many :phones do
    link(:related) { v1_contact_phones_url(object.id) }
  end
  has_one :address do
    link(:related) { v1_contact_address_url(object.id) }
  end

  belongs_to :kind, serializer: KindSerializer, root: :kind do
    link(:related) { v2_contact_kind_url(object.id) }
  end
  has_many :phones, serializer: PhoneSerializer, root: :phones do
    link(:related) { v2_contact_phones_url(object.id) }
  end
  has_one :address, serializer: AddressSerializer, root: :address do
    link(:related) { v2_contact_address_url(object.id) }
  end

  link(:self) { v1_contact_url(object) }

  def attributes(*args)
    hash = super(*args)
    # hash[:kind] = object.kind.description
    hash[:phones] = object.phones.map(&:number)
    hash[:address] = object.address.street if object.address.present?
    hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash
  end

  # private

  # meta do
  #   {author: "André Filipe Fonsêca Borba"}
  # end
end
