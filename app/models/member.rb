class Member < ApplicationRecord
    validates_presence_of :name, :photo
end
