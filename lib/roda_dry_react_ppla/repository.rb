# auto_register: false

require "roda_dry_react_ppla/container"
require "roda_dry_react_ppla/import"

module RodaDryReactPpla
  class Repository# < ROM::Repository::Root
    include Import.args["persistence.rom"]
  end
end
