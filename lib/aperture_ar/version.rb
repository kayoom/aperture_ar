module ApertureAr
  class Version < Base
    establish_connection :library
    
    belongs_to :master, :foreign_key => 'masterId'
    has_many :keyword_for_versions, :foreign_key => 'versionId'
    has_many :keywords, :through => :keyword_for_versions
  end
end