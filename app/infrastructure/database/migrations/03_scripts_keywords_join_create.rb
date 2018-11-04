# frozen_string_literal: true

require 'sequel'

Sequel.migration do
  change do
    create_table(:scripts_keywords) do
      primary_key [:script_id, :keyword_id]
      foreign_key :script_id, :scripts
      foreign_key :keyword_id, :keywords

      index [:script_id, :keyword_id]
    end
  end
end