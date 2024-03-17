#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""Ensemble command line interface. See <insert website here> for more info.

Commands:

  * run: Run the ensemble model.
  * cleanup: Delete all model runs more than one week old.
  * xsd: Validate the ecospold2 files in <dirpath> against the default XSD or another XSD specified in <schema>.

Usage:
  # TODO: Adapt for ensemble
  ensemble-cli run <dirpath> [--noshow] [--save=<strategy>]
  ensemble-cli cleanup
  ensemble-cli -h | --help
  ensemble-cli --version

Options:
  -h --help          Show this screen.
  --version          Show version.

"""
from docopt import docopt
import os
import sys


def main():
    try:
        pass
    except KeyboardInterrupt:
        print("Terminating ensemble CLI")
        sys.exit(1)


if __name__ == "__main__":
    main()
