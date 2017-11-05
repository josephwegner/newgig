class Email < ApplicationRecord
  belongs_to :conversation

  validate :validate_mongo
  before_save :update_mongo

  def body
    return mongo_record.body
  end

  def body=(value)
    self.mongo_record.body = value
  end

  def validate_mongo
    if not self.mongo_id
      if self.body.nil?
        errors.add(:body, 'body must have a value')
      end
    end

    true
  end

  def update_mongo
    mongo_record.save

    if !self.mongo_id
      self.mongo_id = mongo_record._id
    end
  end

  def mongo_record
    return @mongo_record if @mongo_record

    @mongo_record = EmailDocument.where(_id: self.mongo_id).first

    if not @mongo_record
      @mongo_record = EmailDocument.create()
    end

    @mongo_record
  end
end
