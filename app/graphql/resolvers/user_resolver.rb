module Resolvers
  class UserResolver < Resolvers::BaseResolver
    description "Find books by User"
    type [Types::UserType], null: false
    extras [:lookahead]

    def resolve(lookahead:)
      lookahead.selects?(:books).then do |books|
        books ? User.includes(:books) : User
      end
    end
  end
end
