class Item < ApplicationRecord
  validates :description, presence: true
  after_create_commit { broadcast_append_to "items" }
  after_create_commit { broadcast_update_to 'total_count'}
  after_destroy_commit { broadcast_remove_to "items" }
end
