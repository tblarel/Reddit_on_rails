# == Schema Information
#
# Table name: comments
#
#  id                :bigint(8)        not null, primary key
#  user_id           :integer          not null
#  post_id           :integer          not null
#  content           :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  parent_comment_id :integer
#

class Comment < ApplicationRecord
    validates :user_id, :post_id, :content, presence: true

    has_many :child_comments,
        foreign_key: :parent_comment_id,
        class_name: :Comment

    belongs_to :parent_comment,
        foreign_key: :parent_comment_id,
        class_name: :Comment,
        optional: true

    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User

    belongs_to :post,
        foreign_key: :post_id,
        class_name: :Post
end
