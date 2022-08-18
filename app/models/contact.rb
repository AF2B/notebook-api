class Contact < ApplicationRecord
  belongs_to :kind

  def as_json(_options = {})
    super(except: %i[created_at updated_at kind_id])
  end
end
