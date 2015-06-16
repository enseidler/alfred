require 'digest/md5'

Alfred::App.helpers do
  def profile_photo
    hash = Digest::MD5.hexdigest(current_account.email.downcase)
    @image_src = "https://s.gravatar.com/avatar/#{hash}?s=55"
    session[:profile_photo] = @image_src
  end
end