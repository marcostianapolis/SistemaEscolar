require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env)

module SisEscolar
  class Application < Rails::Application
    config.encoding = "utf-8"

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    config.time_zone = 'Brasilia'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :pt_BR

    # Faz com que a asset pipeline encontre os arquivos adicionados em vendor tendo uma sub-pasta
    # para cada lib, permitindo assim que as imagens, css e js daquela lib fiquem centralizadas
    # para facilitar futuras atualizações.
    config.assets.paths += Dir["#{Rails.root}/vendor/asset-libs/**/"].sort_by { |dir| -dir.size }
  end
end
