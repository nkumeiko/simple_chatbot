class ContactConfirmationChatLine < ChatLine
  private

  def after_reply
    user.update_attributes(username: current_reply)
  end
end
