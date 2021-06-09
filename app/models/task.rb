class Task < ApplicationRecord
  #belongs_to :user
  validates :user_id, presence: true
  validates :task, presence: true
  validates :duedate, presence: true
end
