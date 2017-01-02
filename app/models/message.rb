class Message < ActiveRecord::Base
  def self.log(message, user)
    create(datetime: Time.now.to_i, message: message, user_id: user.id)
  end
end
