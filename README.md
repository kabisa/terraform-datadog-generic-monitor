# terraform-datadog-generic-monitor

This module is a base module for most of our datadog alerts.
A good example use can be found [here](https://github.com/kabisa/terraform-datadog-system)

## Getting Started

Pre-commit:
   - Install [pre-commit](http://pre-commit.com/). E.g. `brew install pre-commit`.
   - Run `pre-commit install` in this repo. (Every time you cloud a repo with pre-commit enabled you will need to run the pre-commit install command)
   - That’s it! Now every time you commit a code change (`.tf` file), the hooks in the `hooks:` config `.pre-commit-config.yaml` will execute.
