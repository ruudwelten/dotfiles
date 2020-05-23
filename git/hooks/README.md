# Git hooks

## post-receive

This hook deploys the pushed repository to the staging or development
environment on the server. It works with destination directories that have
existing files in it by copying the repository from a temporary directory. Note
that this method will overwrite any file with the same name.  

Replace `<base_directory>`, `<staging_directory>` and `<production_directory>`
with the corresponding paths and set the file to be executable:
`chmod +x post-receive`.
