# frozen_string_literal: true

# auto_register: false

require 'rom-repository'
require 'roda_dry_react_ppla/container'
require 'roda_dry_react_ppla/import'

module RodaDryReactPpla
  class Repository < ROM::Repository::Root
    include Import.args['db.rom']
  end
end
