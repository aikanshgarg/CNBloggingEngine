class NewCommentEmailWorker

# queue is a keyword with name emails
	@queue = :emails

# perform function is called first by default
	def self.perform(comment_id)
		puts('sending comment_email')
	end

end