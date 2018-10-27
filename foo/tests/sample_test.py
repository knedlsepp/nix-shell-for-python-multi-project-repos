#!/usr/bin/env python
from foo.module_name import sum


def test_sum():
    assert sum(1, 2) == 3
    assert sum(1, -1) == 0
    assert sum(1., -1.) < 1e-5
