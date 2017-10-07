class Customer < ApplicationRecord
	paginates_per 10
  serialize :roleIds, Array
end
