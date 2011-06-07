require 'active_record'
require 'sqlite3'

module ApertureAr
  class Base < ActiveRecord::Base
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
        lib_db = File.join library_path, "Database", "Library.apdb"
        
        self.configurations = {
          "library" => {
            "adapter" => "sqlite3",
            "database" => lib_db,
            "pool" => 5,
            "timeout" => 5000
          }
        }
        
        require 'aperture_ar/master'
        require 'aperture_ar/keyword_for_version'
        require 'aperture_ar/version'
        require 'aperture_ar/keyword'
      end
    end
  end
end