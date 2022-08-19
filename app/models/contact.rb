class Contact < ApplicationRecord
  belongs_to :kind
  has_many :phones

  def birthdate_formatted_ptbr
    I18n.localize(birthdate) unless birthdate.blank?
  end

  def to_ptbr
    {
      name: name,
      email: email,
      birthdate: birthdate_formatted_ptbr,
      kind: kind.description
    }
  end

  def as_json(_options = {})
    super(except: %i[created_at updated_at kind_id])
  end
end
