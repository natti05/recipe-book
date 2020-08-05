class Recipe < ApplicationRecord
  has_many :ingredients, :dependent => :delete_all
  has_many :preparations, :dependent => :delete_all
  belongs_to :user
  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :preparations, reject_if: :all_blank, allow_destroy: true
  # validates :title, :description, :image, presence: true
  has_attached_file :image, styles: { medium: "400x400#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  DIFFICULTIES = ["easy", "moderate", "challenging"]
  # validates :difficulty, inclusion: {in: DIFFICULTIES}
end
