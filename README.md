# DevOps Assignments

![Docker Build CI](https://github.com/alokgorithm/devseccops-assignments/actions/workflows/build.yml/badge.svg)

Solutions for the DevOps Linux scripting and Docker CI assignments.

## Assignments

- [`assignment1-linux-scripting/`](./assignment1-linux-scripting) - System info script (`sysinfo.sh`), access log report (`log_report.sh`), sample log, and cron setup.
- [`assignment2-docker-ci/`](./assignment2-docker-ci) - Dockerized Flask app (`/`, `/health`), `.dockerignore`, non-root user, [GitHub Actions workflow](./.github/workflows/build.yml), and Task 4 bug fixes.

## Quick Run

Clone the repo:

```bash
git clone https://github.com/alokgorithm/devseccops-assignments.git
cd devseccops-assignments
```

Assignment 1 (Linux / WSL):

```bash
cd assignment1-linux-scripting
chmod +x sysinfo.sh log_report.sh
./sysinfo.sh
./log_report.sh sample.log
```

Assignment 2 (Docker):

```bash
cd assignment2-docker-ci
docker build -t devops-app .
docker run -d --name devops-app -p 5000:5000 devops-app
curl http://localhost:5000/health
docker rm -f devops-app
```
