class Article < ActiveRecord::Base
    has_and_belongs_to_many :candidates
    has_many :userfavors
    has_many :users, through: :userfavors
end
