# frozen_string_literal: true

require "mkmf-rice"

vendor = File.expand_path("../../vendor", __dir__)

# numo-narray
numo = File.join(Gem.loaded_specs["numo-narray"].require_path, "numo")
abort "Numo header not found" unless find_header("numo/narray.h", numo)
abort "Numo library not found" if Gem.win_platform? && !find_library("narray", nil, numo)
find_header("numo.hpp", File.expand_path("../../include", __dir__))

dir_config "umap", vendor, vendor
dir_config "umappp", File.join(vendor, "umappp"), File.join(vendor, "umappp")

create_makefile("umap/umap")
