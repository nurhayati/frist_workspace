class Article < ActiveRecord::Base
  # Relationship
  has_many  :comments, dependent: :destroy

  # Validation
  validates :title, presence: true,
                    length: { minimum: 10 }
end
