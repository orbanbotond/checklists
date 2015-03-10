class UserStatus < DisplayCase::Exhibit

  def self.applicable_to?(object, context)
    object.class.name == "Subscribem::User"
  end

  def status(account)
    if invitation_accepted_at.nil? && invitation_sent_at.present?
      'invited'
    else
      has_role?( :admin, account) ? 'admin' : 'member'
    end
  end

end
