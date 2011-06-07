require 'active_record'
require 'sqlite3'

module ApertureAr
  class Base < ActiveRecord::Base
    class_attribute :aperture_library
    self.abstract_class = true
    self.table_name_prefix = "RK"
    self.primary_key = "modelId"
        
    class << self
      def undecorated_table_name class_name = base_class.name
        table_name = class_name.to_s.demodulize
        table_name
      end
      
      def inheritance_column
        "sti_type"
      end
      
      def configure_aperture_library library_path
        self.aperture_library = library_path
        lib_db = File.join library_path, "Database", "Library.apdb"
        img_db = File.join library_path, "Database", "ImageProxies.apdb"
        prop_db = File.join library_path, "Database", "Properties.apdb"
        
        default = {
          "adapter" => "sqlite3",
          "pool" => 5,
          "timeout" => 5000
        }
        
        self.configurations = {
          "library" => default.merge("database" => lib_db),
          "properties" => default.merge("database" => prop_db),
          "image_proxies" => default.merge("database" => img_db)
        }
        
        require 'aperture_ar/master'
        require 'aperture_ar/keyword_for_version'
        require 'aperture_ar/version'
        require 'aperture_ar/keyword'
        require 'aperture_ar/image_proxy_state'
        require 'aperture_ar/exif_string_property'
        require 'aperture_ar/exif_number_property'
      end
    end
  end
end