class Like < ApplicationRecord
	validates :passive_user, {presence: true}
	validates :active_user, {presence: true}
end
