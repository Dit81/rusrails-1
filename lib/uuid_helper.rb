require 'rubygems'
require 'uuidtools'

module UUIDHelper
  def before_create()
    self.fguid = UUIDgrr.create_random.to_s
  end
end