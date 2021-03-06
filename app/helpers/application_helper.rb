module ApplicationHelper
	
	#Return a title on a per-page basis
	def title
		base_title = "Mellterm Translation and Terminology"
		if @title.nil?
			base_title
		else
			"#{base_title} | #{@title}"
		end
	end
	
	def logo
		image_tag("mt_logo3.png", :alt => "mellterm", :class => "round")
	end
	
end
