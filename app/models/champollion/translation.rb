module Champollion
  class Translation < ActiveRecord::Base
    self.table_name = "translations"

    has_paper_trail

    validates :locale, presence: true
    validates :key, presence: true
    validates :value, presence: true
  end
end
