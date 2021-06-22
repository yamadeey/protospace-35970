class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :comments
  # validates :text, presence: true
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence: true
  

  # validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
