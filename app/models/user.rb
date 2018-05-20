class User  < ActiveRecord::Base

  has_many :inventories

  validates :name, :age, :gender, :lat, :long, presence: :true
  validates :gender, format: { with: /\A[m|f]\z/,
                               message: I18n.t('.errors.messages.invalid', resource: User.human_attribute_name(:gender)) }

  scope :infected, -> {  where('infection_alarm_count >= 3')}
  scope :non_infected, -> {  where('infection_alarm_count < 3')}

  after_create :build_inventory

  def infected?
    infection_alarm_count >= 3
  end

  def build_inventory
    Inventory::ITEMS.each do |item, _|
      self.inventories.create item: item
    end
  end
end
