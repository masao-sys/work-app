# == Schema Information
#
# Table name: management_comments
#
#  id            :bigint           not null, primary key
#  content       :text             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  management_id :bigint           not null
#  user_id       :bigint           not null
#
# Indexes
#
#  index_management_comments_on_management_id  (management_id)
#  index_management_comments_on_user_id        (user_id)
#
require 'test_helper'

class ManagementCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
