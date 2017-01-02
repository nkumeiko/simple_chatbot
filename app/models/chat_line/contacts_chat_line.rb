class ContactsChatLine < ChatLine
  private

  def prepare_request(request)
    request.gsub!('USERNAME', user.username)
  end
end
