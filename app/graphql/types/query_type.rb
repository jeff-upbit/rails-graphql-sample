module Types
  class QueryType < Types::BaseObject
    description "The query root of this schema"
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :user, UserType, null: false, description: "Find a user" do
      argument :id, ID, required: true
    end

    field :users, [UserType], null: false, description: "Find all users n+1 solution 1"

    field :users_2, [UserType], null: false, description: "Find all users n+1 solution 2", resolver: Resolvers::UserResolver do
      complexity -> (ctx, args, child_complexity) {
        1
      }
    end

    field :books, [BookType], null: false, description: "Find all books n+1 solution 3"

    field :houses, [HouseType], null: false, description: "Find all houses n+1 solution 4"

    def user(id:)
      User.find(id)
    end

    def users
      User.includes(:books).all
    end

    def books
      Book.all
    end

    def houses
      House.all
    end
  end
end
