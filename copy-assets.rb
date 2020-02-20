#!/usr/bin/env ruby

require 'fileutils'

ASSETS_SOURCE = './node_modules/govuk-frontend/govuk/assets'.freeze
ASSETS_DESTINATION = './source/assets/'.freeze

puts 'copying assets from GOV.UK Frontend into our own folder...'

FileUtils.cp_r ASSETS_SOURCE, ASSETS_DESTINATION

puts 'done copying assets.'
