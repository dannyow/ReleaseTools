
# Release Tools

A fairly random suite of tools to perform various release-related tasks,

Current tools:

- appcast
- archive:
- compress
- export
- publish
- updateBuild


## Appcast

Rebuilds the appcast file.

Assumes that the submodule defining the website which hosts the appcast is located at `Dependencies/Website`.

## Archive

Run `xcodebuild archive` to archive the application for distribution.

The scheme to build is either specified explicitly, or set previously using `--set-default`.

## Compress

Compresses the output of the `export` command into a zip archive suitable for inclusion in the `appcast`.

## Export

Exports the output of the `archive` command as something suitable for distribution outside of the Apple storew (eg with Sparkle).

## Publish

Commits and publishes the latest changes to the website repo.

Assumes that the submodule defining the website which hosts the appcast is located at `Dependencies/Website`.

## UpdateBuild

Outputs the `Configs/BuildNumber.xcconfig` file, containing a build number derived from the count of git commits.

# Building

The tool is currently built using swift package manager: `swift build`.

You can build and run in a single line with `swift run ReleaseTools <command> <args>`.



# Workflow Notes

The workflow is broken down into separate steps, to make them easier to debug. 

The full list, in the order that they run, is:

- archive - to build the release version
- updateBuild (implicitly during the build process)
- (notarize) - to notarize the release 
- export - to extract the notarized application
- compress - to make the zip archive
- appcast - to update the appcast xml to include the new zip
- publish - to commit the new zip and appcast to the website

When running `archive`, we currently rely on the scheme name being the same as the eventual output.

The appcast command needs the Sparkle key. It reads this from the keychain, from a key named "<scheme> Sparkle Key".

