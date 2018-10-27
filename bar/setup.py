# -*- coding: utf-8 -*-
import setuptools

ext_modules = []

config = {
    'name': 'bar',
    'version': '0.1',
    'packages': setuptools.find_packages('src'),
    'package_dir': {'': 'src'},
    'install_requires': [],
    'setup_requires': ['pytest-runner'],
    'test_suite': 'tests',
    'tests_require': ['pytest'],
    'ext_modules': ext_modules,
}

setuptools.setup(**config)
