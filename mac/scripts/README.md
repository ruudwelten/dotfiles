# macOS scripts

## .fixgit

Working with git repositories over the network on macOS an error could
appear as follows: `fatal: Could not write new index file.` If this happens
regularly, place `.fixgit` in the repository root and include it in
`.gitignore`. And run `chmod +x .fixgit`. This bash script will backup the
repository index file and copy in its place a new one which will solve the
problem temporarily.
