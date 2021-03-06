require 'exifr'

module ApertureAr
  class Version < Base
    establish_connection :library
    
    belongs_to :master, :foreign_key => 'masterId'
    has_many :keyword_for_versions, :foreign_key => 'versionId'
    has_many :keywords, :through => :keyword_for_versions
    belongs_to :folder, :foreign_key => 'projectUuid', :primary_key => 'uuid'
    
    belongs_to :stack_content, :foreign_key => 'uuid', :primary_key => 'versionUuid'
    
    def preview_path
      @preview_path ||= ImageProxyState.for_version(self).try :fullSizePreviewPath
    end
    
    def full_preview_path
      @full_preview_path ||= preview_path && File.join(self.class.aperture_library, "Previews", preview_path)
    end
    
    def jpg?
      !!(preview_path =~ /\.jpg$/)
    end
    
    def exif
      @exif ||= load_exif_data
    end
    
    def has_keyword? keyword
      keywords.map(&:name).include? keyword
    end
    
    protected
    def load_exif_data
      if full_preview_path && jpg? && File.exist?(full_preview_path)
        EXIFR::JPEG.new full_preview_path
      end
    end
  end
end