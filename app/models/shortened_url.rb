# == Schema Information
#
# Table name: shortened_urls
#
#  id           :bigint(8)        not null, primary key
#  long_url     :string
#  short_url    :string
#  submitter_id :integer
#

class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true
    validates :short_url, presence: true, uniqueness: true

    belongs_to :submitter,
        primary_key: :id,
        foreign_key: :submitter_id,
        class_name: :User

        belongs_to :submitter,
        primary_key: :id,
        foreign_key: :submitter_id,
        class_name: :User


    def self.create_from_user_and_url(user, long_url)

        ShortenedUrl.create!(
            submitter: user,
            long_url: long_url,
            short_url: ShortenedUrl.random_code)

    end

     def self.random_code
        while true
            rand = SecureRandom.urlsafe_base64(16)
            return rand unless ShortenedUrl.exists?(short_url: rand)
        end

     end


end
