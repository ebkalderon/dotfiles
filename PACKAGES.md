# Dotfiles Package Format

The dotfiles in this repository are defined in terms of _packages_. These
packages adhere to a declarative and largely self-describing format.

When the `dotfiles` script executes, it first scans the current directory for
all valid packages present on disk before performing any action. The criteria
for what constitutes a "valid package" is described below.

## 1. Directory layout

A dotfiles package is a filesystem directory matching the following layout:

```text
<package-name>/              Package directory ①
├── config{,-linux,-macos}/    Base config `stow` package(s) ②
├── config-<profile-name>/     Profile-specific `stow` package(s) ③
└── package.sh                 Package script ④
```

A package directory **must** contain a base `stow` config and/or `package.sh`
script in order to be considered valid. This means that config-less or
hook-less packages are possible, but not both.

All other files present in the directory are ignored for the purposes of
package detection.

> **Note:** Since a dotfiles package directory is itself a valid GNU Stow
> directory, additional CLI arguments to `stow` can be passed in by creating a
> `.stowrc` file directory in the package directory ([upstream docs][stow]).
> This may be used to tune the stowing/unstowing behavior of the config files.

[stow]: https://www.gnu.org/software/stow/manual/html_node/Resource-Files.html

### 1.1. Package directory

* Allowed top-level directory names: `^[A-Za-z0-9._-]+$`
* The name of this directory becomes the _package name_.

### 1.2. Base config `stow` packages

* Must be **exactly one** of the following:
  1. Single unified dir: `config` (deployed on all platforms)
  2. Platform-specific dir(s): `config-linux` and/or `config-macos`
* If both the unified `config` dir and `config-{linux,macos}` exist, the former
  will take precedence over the latter.
* Deploys to/from `$HOME` via `stow --restow` or `stow --delete`, respectively.

### 1.3. Profile-specific `stow` packages (optional)

* Any sub-directory of ① whose name matches: `^config-[A-Za-z0-9._-]+$`
  * Disallowed names: `config-all`
  * Everything following the `config-` prefix becomes the name of a _profile_.
* Not installed by `dotfiles install` nor `dotfiles install <package>` by
  default. Enabled manually using a _package specifier_.
  * Package spec syntax: `package+profile` or `package+profile1,profile2`
    * **Example:** `dotfiles install bash+work,desktop`
    * **Meaning:** "Install the `bash/config` + `bash/config-work` +
      `bash/config-laptop` Stow packages to `$HOME`"
* Deploys to/from `$HOME` via `stow --restow` or `stow --delete`, respectively.

### 1.4. Package script

* File name must match: `package.sh`
* Contains optional _package hooks_ executed during package transactions.
* The `package.sh` may contain some or none of the hook functions described
  below. Alternatively, the `package.sh` script may be omitted altogether.

```sh
# NOTE: All package hooks execute inside `$(dirname $(realpath -e package.sh))`
# with `set -euo pipefail` enabled.

function config_prepare() {
    # Executed before `stow --restow` of configs (`dotfiles install`)
}

# If desired, replace `config_prepare` with 1 or both of:
# function config_prepare_linux() { ... }
# function config_prepare_macos() { ... }

function config_cleanup() {
    # Executed after `stow --delete` of configs (`dotfiles uninstall`)
}

# If desired, replace `config_cleanup` with 1 or both of:
# function config_cleanup_linux() { ... }
# function config_cleanup_macos() { ... }

# NOTE: If both a cross-platform package hook function and its
# platform-specific counterpart(s) exist, the former will take precedence over
# the latter.
```