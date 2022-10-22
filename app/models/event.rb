class Event < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true, unless: :content?
  validates :content, presence: true, unless: :title?
  validates :start_time, presence: true
end
