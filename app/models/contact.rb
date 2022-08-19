class Contact < ApplicationRecord
  belongs_to :kind

  def birthdate_formatted_ptbr
    I18n.localize(birthdate) unless birthdate.blank?
  end

  def as_json(_options = {})
    super(except: %i[created_at updated_at kind_id])
  end
end
