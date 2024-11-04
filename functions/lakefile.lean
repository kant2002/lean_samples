import Lake
open Lake DSL

package "functions" where
  -- add package configuration options here

lean_lib «Functions» where
  -- add library configuration options here

@[default_target]
lean_exe "functions" where
  root := `Main
