class ApplicationController < ActionController::API
  respond_to :json

  def csv_garbled(data)
    data.encode('gb2312', invalid: :replace, undef: :replace, replace: '?')
  end
  
end
