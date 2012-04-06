class Person < ActiveRecord::Base
  scope :activated, where(:activated => true)
end
