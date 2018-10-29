module TimeHelper
	def relativeTime date
		start = date.strftime "%Y%m%d"
		#moment(start).fromNow()
	end
end