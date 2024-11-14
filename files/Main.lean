import Files

def cleanupLine (line: String) :=
  let line := line.replace "\n" ""
  let line := line.replace "\r" ""
  let line := line.trim
  line

def main : IO Unit := do
  let inputHandle ← IO.FS.Handle.mk ⟨"input.txt"⟩ IO.FS.Mode.read
  let content ← IO.FS.Handle.readToEnd inputHandle
  IO.println content

  let sentences := content.split (fun c => c = '.' || c = '?')
  let outputHandle ← IO.FS.Handle.mk ⟨"output.txt"⟩ IO.FS.Mode.write
  let stream := IO.FS.Stream.ofHandle outputHandle
  for sentence in sentences do
    stream.putStrLn (cleanupLine sentence)

  stream.flush
