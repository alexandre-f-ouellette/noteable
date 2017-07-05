class Project < ApplicationRecord
  extend FriendlyId
  friendly_id :short_name, use: :slugged

  validates :name, presence: true
  validates :short_name, presence: true, uniqueness: true, length: { maximum: 20 }
end
