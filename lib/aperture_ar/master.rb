module ApertureAr
  class Master < Base
    establish_connection :library
    
    has_many :versions, :foreign_key => 'masterId'
    
    
  end
end