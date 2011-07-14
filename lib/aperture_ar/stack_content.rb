module ApertureAr
  class StackContent < Base
    establish_connection :library

    has_many :versions, :primary_key => 'versionUuid', :foreign_key => 'uuid'
  end
end