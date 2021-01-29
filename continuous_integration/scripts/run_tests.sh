#!/usr/bin/env bash

set -e

if [[ $PARALLEL == 'true' ]]; then
    export XTRATESTARGS="-n3 $XTRATESTARGS"
fi

if [[ $COVERAGE == 'true' ]]; then
    echo "coverage run `which py.test` dask --runslow --doctest-modules $XTRATESTARGS"
    coverage run `which py.test` dask --runslow --doctest-modules $XTRATESTARGS
else
    echo "py.test dask --runslow $XTRATESTARGS"
    py.test dask --runslow $XTRATESTARGS
fi

set +e
