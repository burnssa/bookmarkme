class Bookmark < ActiveRecord::Base
	belongs_to :user
	belongs_to :topic

	#attr_accessor :thumbnail_url

	def embedly_api
		#Rails.logger.info ">>>>>>>>>> Embedly key: #{ENV['EMBEDLY_API']}"
		embedly_api = Embedly::API.new :key => ENV['EMBEDLY_API'], :user_agent => 'Chrome/37.0 (compatible; bookmarkme/1.0; burnssa@gmail.com)'
	end

	def thumbnail_url
    obj = embedly_api.oembed :url => self.url

    Rails.logger.info obj[0].inspect
    json_obj = JSON.pretty_generate(obj[0].marshal_dump)
    puts json_obj

    thumbnail_url = obj[0].thumbnail_url unless obj[0].blank? || obj[0].thumbnail_url.blank?
    #Rails.logger.info ">>>>>>>>>>>> #{thumbnail_url}"
    thumbnail_url
	end

end
