class Word < ApplicationRecord
  validates :name, presence: true, uniqueness: true
end
