class List < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :bookmarks
  has_many :movies, dependent: :destroy, through: :bookmarks
end
