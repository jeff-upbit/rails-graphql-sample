module Types
  class BookType < Types::BaseObject
    description "A book"
    field :id, ID, null: false
    description "The title of the book"
    field :title, String, null: true
    description "The author of the book"
    field :author, String, null: true
    description "Owner of the book"
    field :user, Types::UserType, null: false
    description "The date the book was published"
    field :published_at, Types::DateScalar, null: true

    def user
      Batch::RecordLoader.for(Book).load(object.user_id)
    end
  end
end
