# Add Mix Dep Script

## Overview

This script provides a simple way to add a new dependency to an Elixir Mix project. It automatically retrieves the latest version of the given package from Hex and appends it to the `deps` list in your `mix.exs` file. The script also installs the dependency using `mix deps.get`.

## Features

- Automatically fetches the latest version of a Hex package.
- Appends the dependency to the `deps` list in `mix.exs`.
- Runs `mix deps.get` to install the newly added dependency.
- Optional debug mode for troubleshooting.

## Prerequisites

- Elixir and Mix must be installed.
- The script is written for Zsh. Ensure you run it in a Zsh-compatible environment.

## Installation

Clone this repository or copy the script to your local machine:

```sh
curl -O https://example.com/add_hex_dependency.zsh
chmod +x add_hex_dependency.zsh
```

### Copy to Home Directory or Oh-My-Zsh Setup

To make the script available anywhere in your terminal, you can copy it to your home directory or an Oh-My-Zsh custom scripts directory and add it to your `$PATH`.

#### Option 1: Copy to Home Directory

Copy the script to your home directory and add it to your `$PATH`:

```sh
mv add_hex_dependency.zsh ~/add-mix-dep
chmod +x ~/add-mix-dep
```

Add the following line to your `~/.zshrc` file to include it in your `$PATH`:

```sh
export PATH="$HOME:$PATH"
```

Reload your `~/.zshrc` file:

```sh
source ~/.zshrc
```

Now you can run the script from anywhere as:

```sh
add-mix-dep <package_name>
```

#### Option 2: Oh-My-Zsh Custom Scripts Directory

If you use Oh-My-Zsh, you can copy the script to the custom plugins directory:

```sh
mkdir -p ~/.oh-my-zsh/custom/plugins/add-mix-dep
mv add_hex_dependency.zsh ~/.oh-my-zsh/custom/plugins/add-mix-dep/add-mix-dep
chmod +x ~/.oh-my-zsh/custom/plugins/add-mix-dep/add-mix-dep
```

Add the following alias to your `~/.zshrc` file:

```sh
alias add-mix-dep="~/.oh-my-zsh/custom/plugins/add-mix-dep/add-mix-dep"
```

Reload your `~/.zshrc` file:

```sh
source ~/.zshrc
```

Now you can run the script from anywhere as:

```sh
add-mix-dep <package_name>
```

## Usage

Run the script with the package name to add a new dependency to your project:

```sh
./add_hex_dependency.zsh <package_name>
```

### Example

To add the `picosat_elixir` package:

```sh
./add_hex_dependency.zsh picosat_elixir
```

### Debug Mode

Enable debug mode to get additional log output, which helps in troubleshooting:

```sh
./add_hex_dependency.zsh --debug <package_name>
```

## How It Works

1. The script takes the package name as an argument.
2. It uses `mix hex.info` to retrieve the latest version of the package.
3. It appends the dependency to the `deps` list in `mix.exs`.
4. It runs `mix deps.get` to install the newly added dependency.

## Error Handling

- If the package cannot be found, the script will exit with an error message.
- If `mix deps.get` fails, the script will also exit with an error message, indicating a potential network or configuration issue.

## License

This project is licensed under the MIT License.

## Contributions

Feel free to submit a pull request or open an issue if you have suggestions for improvements.

## Author

James Carr (james.r.carr+github@gmail.com)

## Disclaimer

This script directly modifies your `mix.exs` file. Please ensure you have a backup or use version control to track changes before running the script.

