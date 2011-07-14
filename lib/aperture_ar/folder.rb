module ApertureAr
  class Folder < Base
    establish_connection :library
    
    has_many :versions, :foreign_key => 'projectUuid', :primary_key => 'uuid'
  end
end