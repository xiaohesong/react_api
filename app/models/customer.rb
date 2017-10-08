class Customer < ApplicationRecord
  CSV_ATTRIBUTES = %W(姓名 手机号 地址).freeze

	paginates_per 10
  serialize :roleIds, Array

  def self.to_csv
    CSV.generate(headers: true) do |csv|
      csv << CSV_ATTRIBUTES
      all.find_each do |log|
        csv << [
          log.name,
          log.phone,
          log.address,
        ]
      end
		end
  end
end
