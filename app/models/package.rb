class Package < ActiveRecord::Base
  has_one:supplier
  has_many:commodities
  has_many:orders
end
