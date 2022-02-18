# Iter8: Kubernetes Release Optimizer

[![Iter8 release (latest SemVer)](https://img.shields.io/github/v/release/iter8-tools/iter8?sort=semver)](https://github.com/iter8-tools/iter8/releases)
[![GoDoc](https://img.shields.io/static/v1?label=godoc&message=reference&color=blue)](https://pkg.go.dev/github.com/iter8-tools/iter8)
[![Unit test Status](https://github.com/iter8-tools/iter8/workflows/tests/badge.svg)](https://github.com/iter8-tools/iter8/actions?query=workflow%3Atests)
[![Unit test Coverage](https://codecov.io/gh/iter8-tools/iter8/branch/master/graph/badge.svg)](https://codecov.io/gh/iter8-tools/iter8)
[![e2e test Status](https://github.com/iter8-tools/hub/actions/workflows/tests.yaml/badge.svg)](https://github.com/iter8-tools/hub/actions?query=workflow%3Atests)
[![Slack channel](https://img.shields.io/badge/Slack-Join-purple)](https://join.slack.com/t/iter8-tools/shared_invite/zt-awl2se8i-L0pZCpuHntpPejxzLicbmw)
[![Community meetups](https://img.shields.io/badge/meet-Iter8%20community%20meetups-brightgreen)](https://iter8.tools/0.8/getting-started/help/)

>   - Safely rollout apps
>   - Maximize business value
>   - Use with any app/serverless/ML framework
>   - Simplify CI/CD/GitOps

## To start using Iter8

Iter8 documentation is available [here](https://iter8.tools). Get started with Iter8 experiments in seconds using the following links.

1.  [Install Iter8](https://iter8.tools/0.8/getting-started/install/)
2.  [Your first Iter8 experiment](https://iter8.tools/0.8/getting-started/your-first-experiment/)
3.  [Load test HTTP services with SLOs](https://iter8.tools/0.8/tutorials/load-test-http/usage/)
4.  [Load test gRPC services with SLOs](https://iter8.tools/0.8/tutorials/load-test-grpc/usage/)

## To start developing Iter8

Contributions are welcome! 

See [here](CONTRIBUTING.md) for information about ways to contribute, Iter8 community meetings, finding an issue, asking for help, pull-request lifecycle, and more.

***

This repo is the source for [Iter8 documentation](https://iter8.tools), which uses [Material for Mkdocs](https://squidfunk.github.io/mkdocs-material/). The source for Iter8 experiment charts is [here](https://github.com/iter8-tools/hub). The source for the Iter8 CLI is [here](https://github.com/iter8-tools/iter8).

#### Locally serve Iter8 docs
From the root of this repo:

```shell
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
mkdocs serve -s
```

You can now see your local docs at [http://localhost:8000](http://localhost:8000). You will also see live updates to [http://localhost:8000](http://localhost:8000) as you update the contents of the `docs` folder.

