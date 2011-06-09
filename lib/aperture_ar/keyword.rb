require 'digest'

module ApertureAr
  class Keyword < Base
    establish_connection :library
    
    has_many :keyword_for_versions, :foreign_key => 'keywordId'
    has_many :versions, :through => :keyword_for_versions
    
    before_create :create_uuid
    
    protected
    def create_uuid
      self.uuid = sha1 name, Time.now.to_i.to_s
    end
    
    def sha1 *strings
      d = Digest::SHA1.new
      strings.each do |string|
        d << string
      end
      
      d.to_s
    end
  end
end