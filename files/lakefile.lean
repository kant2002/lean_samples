import Lake
open Lake DSL

package "files" where
  -- add package configuration options here

lean_lib «Files» where
  -- add library configuration options here

@[default_target]
lean_exe "files" where
  root := `Main
