class Inventory < ActiveRecord::Base
  belongs_to :user

  validates :item, presence: :true
  validates :quantity, numericality: { only_integer: true, greater_than_or_equal_to: 0}

  scope :water, -> { where(item: 'water') }
  scope :food, -> { where(item: 'food') }
  scope :medication, -> { where(item: 'medication') }
  scope :ammunition, -> { where(item: 'ammunition') }

  #name and points to item
  ITEMS = {
      water: 4,
      food: 3,
      medication: 2,
      ammunition: 1
    }

  def point
    Inventory::ITEMS[item.to_sym]
  end
end
