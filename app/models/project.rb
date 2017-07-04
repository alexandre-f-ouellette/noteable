class Project < ApplicationRecord
  validates :name, presence: true
  valdatess :short_name, presence: true
end
