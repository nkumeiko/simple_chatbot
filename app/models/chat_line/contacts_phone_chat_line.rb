class ContactsPhoneChatLine < ChatLine
  private

  def after_reply
    user.update_attributes(user_phone: current_reply)
  end
end
