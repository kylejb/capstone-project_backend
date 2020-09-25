class Entry < ApplicationRecord
  belongs_to :user, inverse_of: :entries
  validates_presence_of :user
  belongs_to :beach
end
