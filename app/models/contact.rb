class Contact < ApplicationRecord
  before_destroy :destroy_phones
  before_destroy :destroy_addresses

  belongs_to :kind, optional: true
  has_many :phones
  has_one :address

  accepts_nested_attributes_for :phones, allow_destroy: true
  accepts_nested_attributes_for :address, update_only: true

  def birthdate_formatted_ptbr
    I18n.localize(birthdate) unless birthdate.blank?
  end

  def locale_to_ptbr
    I18n.locale = :pt_BR
  end

  private

  def destroy_phones
    phones.destroy_all
  end

  def destroy_addresses
    address.destroy
  end
end
