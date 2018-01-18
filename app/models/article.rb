class Article < ApplicationRecord
#  すべての記事にタイトルが存在し、その長さが5文字以上であるバリデーション
  validates :title, presence: true, length: {minimum: 5}
end
