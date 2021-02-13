# == Schema Information
#
# Table name: reads
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  information_id :bigint           not null
#  user_id        :bigint           not null
#
# Indexes
#
#  index_reads_on_information_id  (information_id)
#  index_reads_on_user_id         (user_id)
#
class Read < ApplicationRecord
  belongs_to :user
  belongs_to :information
end
