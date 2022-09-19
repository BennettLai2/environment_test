class User < ApplicationRecord
    has_many :book, through: :user_books
    has_many :user_books
end
