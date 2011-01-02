module ApplicationHelper
	
	#Return a title on a per-page basis
	def title
		base_title = "Mellterm Basic Job Man Application"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
	
	def logo
		image_tag("logo.png", :alt => "mellterm", :class => "round")
	end
	
end
