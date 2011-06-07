module ApertureAr
  class KeywordForVersion < Base
    establish_connection :library
    
    belongs_to :version, :foreign_key => 'versionId'
    belongs_to :keyword, :foreign_key => 'keywordId'
  end
end