import Lake
open Lake DSL

require LSpec from git
  "https://github.com/argumentcomputer/LSpec" @ "504a8cecf8da601b9466ac727aebb6b511aae4ab"

package "unittests" where
  -- add package configuration options here

lean_lib «Unittests» where
  -- add library configuration options here

@[default_target]
lean_exe "unittests" where
  root := `Main

lean_exe Tests.FizzBuzz
