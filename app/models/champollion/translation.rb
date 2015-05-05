module Champollion
  class Translation < ActiveRecord::Base
    self.table_name = "translations"

    has_paper_trail

    validates :locale, presence: true
    validates :key, presence: true
    validates :value, presence: true

    def self.all_translations
      # create empty hash for locales
      translation_hash = Hash.new { |k,v| k[v] = {} }

      # iterate through the translation records
      all.each do |translation|
        # get the key components
        key_scopes = translation.key.split(".")

        translation_hash[translation.locale.to_sym] ||= {}
        translation_hash[translation.locale.to_sym].merge!(key_scopes.reverse.inject(translation.value) {|a,n| { n.to_sym => a}})
      end

      translation_hash 
    end
  end
end
