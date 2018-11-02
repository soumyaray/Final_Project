require 'roda'
require 'yaml'
require 'json'


module SeoAssistant
  # Configuration for the App
  class App < Roda
    UNSPLASH_CONFIG = YAML.safe_load(File.read('config/secrets.yml'))
    UNSPLASH_ACCESS_KEY = UNSPLASH_CONFIG['UNSPLASH_ACCESS_KEY']
    GOOGLE_CONFIG = JSON.parse(File.read('config/google_credential.json'))
  end
end