module ApertureAr
  class Keyword < Base
    establish_connection :library
    
    has_many :keyword_for_versions, :foreign_key => 'keywordId'
    has_many :versions, :through => :keyword_for_versions
  end
end