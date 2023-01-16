class Bookmark < ApplicationRecord
  belongs_to :list
  belongs_to :movie

  validates :comment, length: { minimum: 6 }
  # validates_uniqueness_of :movie_id, :scope => %i[list_id]
  validates :movie_id, uniqueness: {scope: :list_id, message: "is already in the list"}
end
