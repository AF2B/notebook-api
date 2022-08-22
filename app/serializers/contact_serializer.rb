class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { contact_kind_url(object.id) }
  end
  has_many :phones do
    link(:related) { contact_phones_url(object.id) }
  end
  has_one :address

  link(:self) { contact_url(object) }

  def attributes(*args)
    hash = super(*args)
    hash[:kind] = object.kind.description
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
