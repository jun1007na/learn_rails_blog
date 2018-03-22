class Article < ApplicationRecord
#  多数のコメントを関連付け, 記事に関連付けられているコメントを削除
  has_many :comments, dependent: :destroy
#  すべての記事にタイトルが存在し、その長さが5文字以上であるバリデーション
  validates :title, presence: true, length: {minimum: 5}
end
