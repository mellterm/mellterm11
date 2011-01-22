# == Schema Information
# Schema version: 20110121082437
#
# Table name: searches
#
#  id                 :integer         not null, primary key
#  search_term        :string(255)
#  source_language_id :integer
#  target_language_id :integer
#  domain_id          :integer
#  is_public          :boolean
#  is_query           :boolean
#  created_at         :datetime
#  updated_at         :datetime
#

class Search < ActiveRecord::Base

def terms
	@terms ||= find_terms
end	

private

def find_terms
	Term.find(:all, :conditions => conditions)
end 


def keyword_conditions
  ["terms.source_content LIKE ?", "%#{source_content}%"] unless source_content.blank?
end

def _sourcelanguage_conditions
	["terms.source_language_id = ?", source_language_id] unless source_language_id.blank?
end

def target_language_conditions
	["terms.target_language_id = ?", target_language_id] unless target_language_id.blank?
end

def category_conditions
  ["terms.domain_id = ?", domain_id] unless domain_id.blank?
end

def is_public_conditions
	["terms.is_public = ?", is_public] unless is_public.blank?
end	

def is_query_conditions
	["terms.is_query = ?", is_query] unless is_query.blank?
end	

def created_at_conditions
	["terms.created_at >= ?", created_at] unless created_at.blank?
end	


def conditions
  [conditions_clauses.join(' AND '), *conditions_options]
end

def conditions_clauses
  conditions_parts.map { |condition| condition.first }
end

def conditions_options
  conditions_parts.map { |condition| condition[1..-1] }.flatten
end

def conditions_parts
  private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
end








	
	def old_find_terms
		
		search = Term.search
		search.source_content_like(source_content) unless source_content.blank?
		search.domain_id_equals(domain_id) unless domain_id.blank?
		search.source_language_id_equals(source_language_id) unless source_language_id.blank?
		search.target_language_id_equals(target_language_id) unless target_language_id.blank?
		search.is_public_is_false unless is_public.present?
		search.is_query_is_false unless is_query?	
		search.all
	end

end
