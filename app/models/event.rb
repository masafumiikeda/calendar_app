class Event < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true, unless: :content?, message: " or Content is can't be blank"
  validates :content, presence: true, unless: :title?, message: " or Title is can't be blank"
  validates :start_time, presence: true
end
