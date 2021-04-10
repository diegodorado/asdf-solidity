<div align="center">

# asdf-solidity ![Build](https://github.com/diegodorado/asdf-solidity/workflows/Build/badge.svg) ![Lint](https://github.com/diegodorado/asdf-solidity/workflows/Lint/badge.svg)

[solidity](https://docs.soliditylang.org/en/latest/) plugin for the [asdf version manager](https://asdf-vm.com).

</div>

# Contents

- [Dependencies](#dependencies)
- [Install](#install)
- [Why?](#why)
- [Contributing](#contributing)
- [License](#license)

# Dependencies

- `bash`, `curl`, `tar`: generic POSIX utilities.
- `SOME_ENV_VAR`: set this environment variable in your shell config to load the correct version of tool x.

# Install

Plugin:

```shell
asdf plugin add solidity
# or
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

Contributions of any kind welcome! See the [contributing guide](contributing.md).

[Thanks goes to these contributors](https://github.com/diegodorado/asdf-solidity/graphs/contributors)!

# License

See [LICENSE](LICENSE) © [Diego Dorado](https://github.com/diegodorado/)
