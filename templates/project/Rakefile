# First need to import Dashing with the Smashing Sinatra App
require 'dashing'
# Then import Sinatra, which will prepare sprockets settings
require 'sinatra'
# Now match the imports from Smashing's app.rb so that the resources are pre-processed
require 'coffee-script'
require 'sass' if RUBY_VERSION < "2.5.0"
require 'sassc' if RUBY_VERSION >= "2.5.0"
# Logger and misc
require 'pathname'
require 'logger'

# From: https://simonecarletti.com/blog/2011/09/using-sprockets-without-a-railsrack-project/
ROOT        = Pathname(File.dirname(__FILE__))
LOGGER      = Logger.new(STDOUT)
BUNDLES     = %w( application.js )
BUILD_DIR   = ROOT.join("assets/javascripts/")

# This contains the settings from the Smashign Sinatra App (see app.rb)
# so no need to append_path, etc.
sprockets = Sinatra::Application.settings.sprockets
sprockets.logger = LOGGER

# Task: precompile-assets
# Pre-compiles sprockets application.js so users don't need to wait for Sinatra/Sprockets
# to generate it on the fly.
# see: https://github.com/Smashing/smashing/issues/189
task :'precompile-assets' do
  BUNDLES.each do |bundle|
    asset = sprockets.find_asset(bundle)
    asset.write_to(BUILD_DIR.join(asset.logical_path))
  end
end
