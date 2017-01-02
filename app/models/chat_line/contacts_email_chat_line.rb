class ContactsEmailChatLine < ChatLine
  private

  def after_reply
    user.update_attributes(user_email: current_reply)
  end
end
