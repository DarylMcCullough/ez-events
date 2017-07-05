class RegisteredApplication < ApplicationRecord
    validates_length_of :name, :minimum => 5
    validates_length_of :url, :minimum => 5
    belongs_to :user
end
