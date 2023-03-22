module Types
  class UserType < Types::BaseObject
    description "A user"
    field :id, ID, null: false
    description "The name of the user"
    field :name, String, null: true
    description "The nickname of the user"
    field :nickname, String, null: true
    description "books of the user"
    field :books, [Types::BookType], null: true
    description "houses of the user"
    field :houses, [Types::HouseType], null: true
  end
end
