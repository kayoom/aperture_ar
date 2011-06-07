module ApertureAr
  class ImageProxyState < Base
    establish_connection :image_proxies
    
    class << self
      def for_version version
        where(:versionId => version.id).first
      end
    end
  end
end