module LinkConfig
  SCHEME = ENV['LINK_SCHEME']
  DOMAIN = ENV['LINK_DOMAIN']
  PREFIX = "#{SCHEME}://#{DOMAIN}/"
end
