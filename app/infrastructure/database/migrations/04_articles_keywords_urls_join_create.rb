# frozen_string_literal: true

require 'sequel'

Sequel.migration do
  change do
    create_table(:scripts_keywords_urls) do
      primary_key [:script_id, :keyword_id, :url_id]
      foreign_key :script_id, :scripts
      foreign_key :keyword_id, :keywords
      foreign_key :url_id, :urls

      index [:script_id, :keyword_id, :url_id]
    end
  end
end