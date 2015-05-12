module Champollion
  class Translation < ActiveRecord::Base
    self.table_name = "translations"

    has_paper_trail

    validates :locale, presence: true
    validates :key, presence: true


    def self.all_hash
      # create empty hash for locales
      translation_hash = Hash.new { |k,v| k[v] = {} }

      # iterate through the translation records
      all.each do |translation|
        # get the key components
        key_scopes = translation.key.split(".")

        translation_hash[translation.locale.to_sym] ||= {}
        translation_hash[translation.locale.to_sym].deep_merge!(key_scopes.reverse.inject(translation.value) {|a,n| { n.to_sym => a}})
      end

      translation_hash 
    end

    def last_five
      versions.reverse.first(5).reject {|t| t.index == 0 }
    end
  end
end
