# frozen_string_literal: true

class Session
  include Mongoid::Document
  include Mongoid::Timestamps

  field :_id, type: BSON::ObjectId
  field :user_id, type: BSON::ObjectId
  field :key, type: String

  belongs_to :user, inverse_of: :sesions

  store_in collection: 'sessions', database: 'film_shelf_development'

  before_create do
    self.key = SecureRandom.hex(20)
  end
end
