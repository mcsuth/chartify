class HardWorker
	include Sidekiq::Worker

	def perform(user_id)
    binding.pry
	end
end