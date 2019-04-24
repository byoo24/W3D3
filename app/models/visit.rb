# == Schema Information
#
# Table name: visits
#
#  id              :bigint(8)        not null, primary key
#  user_id         :integer          not null
#  shortenedurl_id :integer          not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Visit < ApplicationRecord
    validations :user_id, :shortenedurl_id, presence: true

    belongs_to :user,
        primary_key: :id,
        foreign_key: :user_id,
        class_name: :User 

     belongs_to :shortenedurl,
        primary_key: :id,
        foreign_key: :shortenedurl_id,
        class_name: :Shortenedurl

    def self.record_visit!(user, shortened_url)


    end


end
