# == Schema Information
#
# Table name: bookmarks
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  information_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_bookmarks_on_information_id  (information_id)
#  index_bookmarks_on_user_id         (user_id)
#
class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :information
end
