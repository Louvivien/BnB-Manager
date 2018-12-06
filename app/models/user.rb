class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :properties

  after_create :subscribe

  def subscribe
    @list_id = Rails.application.credentials.dig(:gibbonlistid)
    gibbon = Gibbon::Request.new

     gibbon.lists(@list_id).members.create(
       body: {
         email_address: self.email,
         status: "subscribed",
         merge_fields: { FNAME: self.first_name }
       }
     )
   end

end
