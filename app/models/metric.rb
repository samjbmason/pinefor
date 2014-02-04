class Metric < ActiveRecord::Base
  validates :name, presence: true, inclusion: { in: %w(user_count) }
  validates :value, presence: true, numericality: { only_integer: true }

  scope :user_count, -> { where(name: "user_count") }
end
