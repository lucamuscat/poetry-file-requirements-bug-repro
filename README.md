# The bug
When using a version of `poetry@2.0.1` installed using `python3.11`, projects depending on local projects
by declaring dependencies using the `file` url (whilst also using the PEP508 specification) fails to
install with the following error: ` The requirement is invalid: invalid URL "file:../dummy"`.

Note that this error does not occur when `poetry` is installed using `python3.12`

# Reproducing the bug
Provided in this repo, one may find a Dockerfile that calls `poetry install` in a project structured
in such a a way to trigger the error.

Run `docker build . --tag poetry-repro --build-arg PYTHON_VERSION=3.11` in order to reproduce the
bug in a local docker container. Note that the error will occur during the build process, so do not
be alarmed by that.

In order to verify that this bug does not occur in `python3.12`, run the following command:
`docker build . --tag poetry-repro --build-arg PYTHON_VERSION=3.11`. Observe how the build completes
sucessfully.