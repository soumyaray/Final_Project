# frozen_string_literal: true

require 'sequel'

Sequel.migration do
  change do
    create_table(:scripts) do
      primary_key :id

      String      :text
      String      :each_keyword
      String      :num_keyword

      DateTime :created_at
      DateTime :updated_at
    end
  end
end