class InvitationForm
  include ActiveModel::Model

  attr_accessor :email

  validates :email, presence: true
end