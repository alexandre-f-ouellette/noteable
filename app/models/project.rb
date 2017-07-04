class Project < ApplicationRecord
  validates :name, presence: true
  validates :short_name, presence: true
end
