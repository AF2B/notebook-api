class Phone < ApplicationRecord
  belongs_to :contact, optinal: true
end
