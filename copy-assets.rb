#!/usr/bin/env ruby

require 'fileutils'

GOVUK_FRONTEND_PATH = './node_modules/govuk-frontend/govuk'.freeze
OUR_PATH = './source'.freeze

ASSETS_MAP = {
  "#{GOVUK_FRONTEND_PATH}/assets" => 'assets',
  "#{GOVUK_FRONTEND_PATH}/all.js" => 'javascripts/dist/',
  'node_modules/gaap-analytics/build/gaap-analytics.min.js' => 'javascripts/dist/'
}.freeze

ASSETS_MAP.each do |src, dest_folder|
  destination = File.join(OUR_PATH, dest_folder)

  puts "[copy-assets.rb] copying #{src} over to #{destination}"

  FileUtils.cp_r src, destination

  puts "[copy-assets.rb] successfully copied #{src} into #{destination}"
end
