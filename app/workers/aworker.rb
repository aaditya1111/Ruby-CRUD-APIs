class Aworker
	include Sidekiq::Worker
	def perform(name, count)
    	puts "This is Sidekiq"
  	end
end