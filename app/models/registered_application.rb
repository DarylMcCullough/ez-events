class RegisteredApplication < ApplicationRecord
    validates_length_of :name, :minimum => 5
    validates_length_of :url, :minimum => 5
    validates_uniqueness_of :url
    validates_uniqueness_of :name
    
    belongs_to :user
end
