CONFIG_PATH="#{Rails.root}/config/game_formats_config.yml"
APP_CONFIG = YAML.load_file(CONFIG_PATH)[Rails.env]