class Post < ActiveRecord::Base
	validates :title, :gif, presence: true, uniqueness: {case_sensitive: false}
end
