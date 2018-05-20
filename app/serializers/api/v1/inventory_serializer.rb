module Api
  module V1
    class InventorySerializer < ActiveModel::Serializer
      attributes :id, :item, :quantity, :point

      def point
        Inventory::ITEMS[object.item.to_sym]
      end
    end
  end
end
