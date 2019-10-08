Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['481626438321-ip3csplutbkticjijn9v50ef11hkcdhg.apps.googleusercontent.com'], ENV['htYAVfEr4sM6R2KQWWHXC34B']
end