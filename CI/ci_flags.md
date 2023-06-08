# CI Signaling

Its possible to configure CI on build a project based on flags in the commit message. This is done by adding a special line to the commit that starts with CI: (must be all caps). The line can contain a list of flags separated by semi-colons. The following flags are supported:
- skip=<Name of stage>
- skip_branch=<Name of parallel branch to skip>:<Name of parent stage>
- enable_only_branch=<Name of parallel branch to enable>:<Name of parent stage>
- env:<Name of environment variable>=<Value of environment variable>
