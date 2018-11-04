# frozen_string_literal: true

require 'sequel'

Sequel.migration do
  change do
    create_table(:keywords) do
      primary_key :id
      foreign_key :text_id, :scripts

      String      :keyword
      String      :eng_keyword
      Symbol      :type
      Float       :importance

      DateTime :created_at
      DateTime :updated_at
    end
  end
end