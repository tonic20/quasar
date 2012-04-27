require 'spec_helper'

describe Document do
  # validations
  it 'validates presence of title' do
    should validate_presence_of :title
  end
  
  it 'validates presence of creator_id' do
    should validate_presence_of :creator_id
  end
  
  # associations
  it 'belong to *user*' do
    should belong_to :creator
  end
  
  it 'belong to another, *master_document*' do
    should belong_to :master_document
  end
  
  it 'have many *slave_documents*' do
    should have_many :slave_documents
  end
  
end
