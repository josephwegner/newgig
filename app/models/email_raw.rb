class EmailRaw < ApplicationRecord
  belongs_to :email
  validates_presence_of :email
end
