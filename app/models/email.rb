class Email < ApplicationRecord
  belongs_to :conversation
  has_one :raw, class_name: 'EmailRaw', inverse_of: :email
  accepts_nested_attributes_for :raw

  after_save :save_raw

  def raw
    @raw ||= super || EmailRaw.new(email: self)
  end

  def save_raw
    @raw.save if @raw
  end
end
