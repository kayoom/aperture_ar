module ApertureAr
  class ExifNumberProperty < Base
    establish_connection :properties
    
    class << self
      def for_version version
        where(:versionId => version.id)
      end
    end
  end
end