import Lake
open Lake DSL

package "console" where
  -- add package configuration options here

lean_lib «Console» where
  -- add library configuration options here

@[default_target]
lean_exe "console" where
  root := `Main
