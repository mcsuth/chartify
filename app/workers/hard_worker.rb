class HardWorker
	include Sidekiq::Worker

	def perform(posts)

		posts.each do |post|
			if post['message']
				puts post['message']
			end
		end

  	next_page = posts.next_page
  	while !next_page.empty?
  		posts = next_page
  		posts.each do |post|
  			if post['message']
  				puts post['message']
  			end
  		end
  		next_page = next_page.next_page
  	end
	end
end