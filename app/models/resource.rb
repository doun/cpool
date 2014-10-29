class Resource < ActiveRecord::Base
  attr_accessor :from, :to
  belongs_to :path
  belongs_to :created_by,class_name:"User"
  belongs_to :driver,class_name:"User"
end
