class Customer < ApplicationRecord
  serialize :roleIds, Array
end
