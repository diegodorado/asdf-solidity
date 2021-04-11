# asdf-solidity
[![Build Status](https://api.travis-ci.com/diegodorado/asdf-solidity.svg)](https://travis-ci.com/github/diegodorado/asdf-solidity)

[solidity](https://docs.soliditylang.org/en/latest/) plugin for the [asdf version manager](https://asdf-vm.com).


# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Contributing](#contributing)

# Dependencies

- `bash`, `curl`, `sed`, `grep`, `awk`: generic POSIX utilities.

# Install

Plugin:

```shell
asdf plugin add solidity https://github.com/diegodorado/asdf-solidity.git
```

solidity:

```shell
# Show all installable versions
asdf list-all solidity

# Install specific version
asdf install solidity latest

# Set a version globally (on your ~/.tool-versions file)
asdf global solidity latest

# Now solidity commands are available
solc --version
```

Check [asdf](https://github.com/asdf-vm/asdf) readme for more instructions on how to
install & manage versions.

# Contributing

Contributions of any kind welcome!

Testing Locally:

```shell
asdf plugin test solidity . solc --version

```

Tests are automatically run on push.

