class UrlInfo < ActiveRecord::Base
	validates_uniqueness_of :href
	validates_presence_of :href
end
