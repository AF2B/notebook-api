class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate

  belongs_to :kind do
    link(:related) { kind_url(object.kind) }
  end
  has_many :phones
  has_one :address

  link(:self) { contact_url(object) }

  def attributes(*args)
    hash = super(*args)
    hash[:kind] = object.kind.description
    hash[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    hash
  end

  # private

  # meta do
  #   {author: "André Filipe Fonsêca Borba"}
  # end
end
