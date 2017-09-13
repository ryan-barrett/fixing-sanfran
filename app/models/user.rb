class User < ApplicationRecord
  has_secure_password

  #Connection to Posts on a 1:m association
  has_many :posts

  def self.confirm(params)
    @user = User.find_by({user_name: params[:user_name]})
    @user ? @user.authenticate(params[:password]) : false
  end

end
