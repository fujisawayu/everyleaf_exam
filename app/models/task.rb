class Task < ApplicationRecord
  validates :title,  presence: true, length: { maximum: 20 }
  validates :content,  presence: true, length: { maximum: 255 }
  validates :deadline, presence: true
  validates :status, presence: true
  enum status: {未着手: 0, 着手中: 1, 完了: 2}

  scope :scope_title, -> (title) {
       where("title LIKE ?","%#{ title }%")
     }
  scope :scope_status, -> (status) {
       where(status: status)
     }
  end