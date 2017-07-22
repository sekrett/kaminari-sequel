# frozen_string_literal: true

require 'kaminari/sequel/version'

require 'kaminari/core'
require 'kaminari/actionview'
require 'kaminari/sequel/sequel_extension'

::Sequel::Model.send :include, Kaminari::SequelExtension
