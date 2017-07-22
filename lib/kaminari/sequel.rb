# frozen_string_literal: true

require 'kaminari/sequel/version'

require 'kaminari/core'
require 'kaminari/actionview'
require 'kaminari/sequel/model_extension'
require 'kaminari/sequel/dataset_extension'

::Sequel::Model.send :include,   Kaminari::Sequel::ModelExtension
::Sequel::Dataset.send :include, Kaminari::Sequel::DatasetExtension
