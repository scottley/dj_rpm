class Reservation < ActiveRecord::Base
  attr_accessible :name, :email_sent

  def may_email?
    true
  end

  def mark_email_sent
    update_column :email_sent, true
  end
end
