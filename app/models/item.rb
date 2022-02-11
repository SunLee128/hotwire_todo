class Item < ApplicationRecord
  validates :description, presence: true
  after_create_commit { broadcast_append_to "items" }
  after_destroy_commit { broadcast_remove_to "items" }
  
end
