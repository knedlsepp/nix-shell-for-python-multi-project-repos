# Using nix-shell in a multi-repo environment

We currently got good support to use `nix-shell` for setting up interactive development environments for nixified python projects.
However it was unclear (to me) how to best make use of this in a multi-repository scenario.
This repository tries to be an example on how to make the best use of nix-shell, especially with pyton in mind.

# Example
We got two python packages, `foo` depending on `bar`.
In a real world scenario, this repository could house git-submodules of the individual packages.
