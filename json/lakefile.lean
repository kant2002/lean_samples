import Lake
open Lake DSL

package "json" where
  -- add package configuration options here

lean_lib «Json» where
  -- add library configuration options here

@[default_target]
lean_exe "json" where
  root := `Main
