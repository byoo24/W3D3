class AddUserToShortenedUrl < ActiveRecord::Migration[5.2]
  def change
    add_column(:shortened_urls, :submitter_id, :integer)
  end
end
