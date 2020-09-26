class Entry < ApplicationRecord
  #? difference b/w this and optional: user
  belongs_to :user, inverse_of: :entries
  validates_presence_of :user
  belongs_to :beach
end
