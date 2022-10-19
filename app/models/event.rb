class Event < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true
  validates :content, presence: true
  validates :start_time, presence: true
end
