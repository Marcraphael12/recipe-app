class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods

  validates :name, :measurement_unit, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validate :no_empty_spaces

  before_validation :strip_spaces

  def strip_spaces
    self.name = name.strip
    self.measurement_unit = measurement_unit.strip
  end

  def no_empty_spaces
    errors.add(:name, 'cannot be only spaces') if name.present? && name.strip.empty?

    return unless measurement_unit.present? && measurement_unit.strip.empty?

    errors.add(:measurement_unit, 'cannot be only spaces')
  end
end
