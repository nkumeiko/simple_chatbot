class ContactChatLine < ChatLine
  private

  def prepare_request(request)
    request.gsub!('USER_CHOICE', user.user_email || user.user_phone)
  end
end
