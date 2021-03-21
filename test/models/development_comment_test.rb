# == Schema Information
#
# Table name: development_comments
#
#  id             :bigint           not null, primary key
#  content        :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  development_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_development_comments_on_development_id  (development_id)
#  index_development_comments_on_user_id         (user_id)
#
require 'test_helper'

class DevelopmentCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
