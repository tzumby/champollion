module Champollion
  module Implementation

    def lookup(locale, key, scope = [], options = {})
      return super unless ActiveRecord::Base.connected? && ChampollionTranslation.table_exists?

      translation = ChampollionTranslation.where(locale: locale.to_s, key: key.to_s).first
      return translation.value if translation
    end
  end
end
