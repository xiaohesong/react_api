class Role < ApplicationRecord
  serialize :permission, Array
end
