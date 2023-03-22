module Types
  class HouseType < Types::BaseObject
    description "A house"
    field :id, ID, null: false
    description "The address of the house"
    field :address, String, null: true
    description "The price of the house"
    field :price, String, null: true
    description "Owner of the house"
    field :user, Types::UserType, null: false

    def user
      dataloader.with(::Sources::ActiveRecord, ::User).load(object.user_id)
    end
  end
end
