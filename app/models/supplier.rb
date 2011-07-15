class Supplier < ActiveRecord::Base
  has_one:package
  has_many:commodities
end
