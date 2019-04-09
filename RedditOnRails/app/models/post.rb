# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  title      :string           not null
#  url        :string
#  content    :text
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord

    validates :title, :user_id, presence: true
 
    has_many :comments,
        foreign_key: :post_id,
        class_name: :Comment

    has_many :postsubs,
        foreign_key: :post_id,
        class_name: :PostSub,
        inverse_of: :post

    has_many :subs,
        through: :postsubs
    
    belongs_to :user,
        foreign_key: :user_id,
        class_name: :User
    
    def top_level_comments
        @top_comments = comments.where(parent_comment_id: nil)
    end
end
