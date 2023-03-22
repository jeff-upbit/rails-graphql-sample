module Types
  class MutationType < Types::BaseObject
    field :create_book, Types::BookType, null: false do
      description "Create a book"
      argument :title, String, required: true
      argument :author, String, required: true
      argument :user_id, ID, required: true
      argument :published_at, Types::DateScalar, required: false
    end

    def create_book(title:, author:, user_id:, published_at: nil)
      Book.create(title: title, author: author, user_id: user_id, published_at: published_at)
    end
  end
end
