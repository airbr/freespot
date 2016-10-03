class Spot < ApplicationRecord
  validates :address, presence: true
  belongs_to :user

  geocoded_by :address
  after_validation :geocode

  # before_save :default_values

  private

# def default_values
#     self.completed ||= false
#     nil                       # required so that the TX will not rollback!!!
#   end
end
