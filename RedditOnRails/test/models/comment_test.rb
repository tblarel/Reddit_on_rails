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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
