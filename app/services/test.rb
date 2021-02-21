class Test
	def worker
		Aworker.perform_async('bob', 5)
	end
end