class Event < ApplicationRecord
  belongs_to :registered_application
  validates :name, presence: true
end
