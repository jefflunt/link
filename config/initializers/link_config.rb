module LinkConfig
  SCHEME = ENV["LINK_SCHEME"]
  DOMAIN = ENV["LINK_DOMAIN"]
  PREFIX = "#{SCHEME}://#{DOMAIN}"
  REDIRECT_STATUS_CODE = ENV["LINK_REDIRECT_STATUS_CODE"].to_i || 301
  BRANDING = ENV["LINK_BRANDING"] || "link: your free URL shortener"
end
