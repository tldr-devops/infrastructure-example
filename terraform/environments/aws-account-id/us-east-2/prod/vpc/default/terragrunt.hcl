include "backend" {
  path = find_in_parent_folders("backend.hcl")
}

include "region" {
  path = find_in_parent_folders("region.hcl")
}
