class EmailDocument
  include Mongoid::Document
  store_in collection: "emails"

  field :body, type: String
end
