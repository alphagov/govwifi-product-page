###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

activate :directory_indexes

# With alternative layout
# page "/path/to/file.html", layout: :otherlayout

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

# General configuration

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Google analytics
# Analytics ID must be inside the single quotes as it’s string
configure :development do
  set :analytics, ""
#   set :analytics, "'UA-XXXXXXXX-X'"
end

# Insert your Google Analytics ID below
configure :build do
  set :analytics, ""
end

###
# Helpers
###

# Methods defined in the helpers block are available in templates
helpers do
  def subnav_active(url)
    current_page.url == url ? 'sub-navigation__item--active' : ''
  end

  def get_nav_active_class(url, root_scope)
    'govuk-header__navigation-item--active' if current_page.url.start_with? (root_scope or url)
  end
end

###
# Redirects
###

redirect "about-govwifi/connect-to-govwifi.html", to: "/connect-to-govwifi/"
redirect "about-govwifi.html", to: "https://docs.wifi.service.gov.uk/"
redirect "about-govwifi/how-govwifi-works.html", to: "https://docs.wifi.service.gov.uk/"
redirect "about-govwifi/organisations-using-govwifi.html", to: "/connect-to-govwifi/organisations-using-govwifi/"

redirect "support.html", to: "/connect-to-govwifi/get-help-connecting/"
redirect "support/update-govwifi-server-certificate.html", to: "/connect-to-govwifi/update-govwifi-server-certificate/"
redirect "support/check-organisation-email-address.html", to: "/connect-to-govwifi/check-organisation-email-address/"
redirect "support/visitor-access-to-govwifi.html", to: "/connect-to-govwifi/ask-staff-member/"

redirect "support/connect-to-govwifi-using-an-android-device.html", to: "/connect-to-govwifi/device-android/"
redirect "support/connect-to-govwifi-using-an-iphone-or-ipad.html", to: "/connect-to-govwifi/device-iphone-or-ipad/"
redirect "support/connect-to-govwifi-using-a-mac-imac-or-macbook.html", to: "/connect-to-govwifi/device-mac/"
redirect "support/connect-to-govwifi-using-a-windows-device.html", to: "/connect-to-govwifi/device-windows/"
redirect "support/connect-to-govwifi-using-a-chromebook.html", to: "/connect-to-govwifi/device-chromebook/"
redirect "support/connect-to-govwifi-using-a-blackberry.html", to: "/connect-to-govwifi/device-blackberry/"
