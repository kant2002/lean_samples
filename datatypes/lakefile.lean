import Lake
open Lake DSL

package "datatypes" where
  -- add package configuration options here

lean_lib «Datatypes» where
  -- add library configuration options here

@[default_target]
lean_exe "datatypes" where
  root := `Main
