class Recipe < ApplicationRecord
  has_many :ingredients
  has_many :preparations
  belongs_to :user
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :preparations, reject_if: :all_blank, allow_destroy: true
  validates :title, :description, presence: true
  has_attached_file :image, styles: { medium: "300x300#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  DIFFICULTIES = ["easy", "moderate", "challenging"]
  validates :difficulty, inclusion: {in: DIFFICULTIES}
end
