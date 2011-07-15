class Order < ActiveRecord::Base
  belongs_to:package
  has_one:commodity
end
