require 'roda'
require 'yaml'

module SeoAssistant
  # Configuration for the App
  class App < Roda
    CONFIG = YAML.safe_load(File.read('config/secrets.yml'))
    UNSPLASH_ACCESS_KEY = CONFIG['UNSPLASH_ACCESS_KEY']
  end
end