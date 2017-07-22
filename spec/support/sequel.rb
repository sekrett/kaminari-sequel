# frozen_string_literal: true

DB = Sequel.sqlite

DB.create_table :users do
  primary_key :id
  Integer :age
  String :name
end
