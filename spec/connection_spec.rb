require 'spec_helper'

describe ApertureAr::Base do
  def sample_lib
    File.join File.dirname(__FILE__), "test_library.aplibrary"
  end
  
  it 'can connect' do
    lambda {
      ApertureAr::Base.configure_aperture_library(sample_lib)
    }.should_not raise_error
  end
  
  describe 'misc' do
    before do
      ApertureAr::Base.configure_aperture_library(sample_lib)
    end
  
    it 'master -> versions association' do
      ApertureAr::Master.first.versions.should_not be_empty
      ApertureAr::Version.first.master.should_not be_nil
    end
    
    it 'version -> keyword association' do
      ApertureAr::Version.last.keywords.should_not be_empty
      ApertureAr::Keyword.last.versions.should_not be_empty
    end
  end
end