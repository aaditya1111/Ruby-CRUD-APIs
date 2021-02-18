class Session
  def self.authenticate(email, password)
    return false if email.blank? || password.blank?
    user = Signup.find_by(email: email)
    user && user.authenticate(password) ? user : false
  end
end