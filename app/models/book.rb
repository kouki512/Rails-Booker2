class Book < ApplicationRecord
  belongs_to :user
  #attachment :user
end
