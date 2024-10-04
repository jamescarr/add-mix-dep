#!/bin/zsh

# Function to print debug messages
debug() {
  if [[ $DEBUG_MODE -eq 1 ]]; then
    echo "[DEBUG] $1"
  fi
}

# Function to append dependency to mix.exs
add_dep_to_mix() {
  local package_name=$1
  debug "Package name: $package_name"

  local version=$(mix hex.info "$package_name" | awk '/Config/ {getline; print $2}')
  debug "Retrieved version: $version"

  if [ -z "$version" ]; then
    echo "Could not find the package or version. Exiting."
    exit 1
  fi

  echo "Adding {:${package_name}, \"~> ${version}\"} to deps in mix.exs..."

  # Using sed to append the dependency to the deps function
  sed -i '' "/defp deps do/a\
  \ \ \ \ {:$package_name, \"~> $version\"}," mix.exs
  debug "Dependency appended to mix.exs"

  echo "Dependency added. Running mix deps.get to install it..."
  if ! mix deps.get; then
    echo "Failed to fetch dependencies. Please check your network connection or mix.exs file."
    exit 1
  fi
  debug "mix deps.get completed successfully"
}

# Check if package name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 [--debug] <package_name>"
  exit 1
fi

# Check for debug flag
DEBUG_MODE=0
if [[ $1 == "--debug" ]]; then
  DEBUG_MODE=1
  shift
fi

# Call function to add dep
debug "Starting to add dependency"
add_dep_to_mix "$1"
debug "Finished adding dependency"
