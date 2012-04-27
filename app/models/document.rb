class Document < ActiveRecord::Base
  attr_accessible :content, :creator_id, :description, :title
end
