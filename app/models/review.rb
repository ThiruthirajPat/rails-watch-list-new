class Review < ApplicationRecord
  belongs_to :list
  validates :content, presence:true
  validates :content, length: { minimum: 6 }
end
