class Spot < ApplicationRecord
  validates :address, presence: true
  belongs_to :user
  has_many :comments

  geocoded_by :address
  after_validation :geocode

  def self.search(search)
    where("title || address || description ILIKE ?", "%#{search}%")
  end

  # before_save :default_values

  private

# def default_values
#     self.completed ||= false
#     nil                       # required so that the TX will not rollback!!!
#   end
end
