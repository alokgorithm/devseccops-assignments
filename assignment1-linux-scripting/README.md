# Linux Shell Scripting & Git

Basic shell scripts for system monitoring and Nginx/Apache access log analysis.

## Files

- `sysinfo.sh` - prints hostname, current date/time, user, `/` disk usage, memory usage, and top 5 processes by memory. Also appends the output to `sysinfo_YYYY-MM-DD.txt`.
- `log_report.sh` - parses an access log file and outputs total requests, 404 count, and top 3 client IPs.
- `sample.log` - sample Nginx-style combined access log for testing `log_report.sh`.

## Usage

```bash
git clone https://github.com/alokgorithm/devseccops-assignments.git
cd devseccops-assignments/assignment1-linux-scripting
chmod +x sysinfo.sh log_report.sh

./sysinfo.sh
./log_report.sh sample.log
```

If `log_report.sh` is run without an argument, it prints a usage message and exits with status 1:

```text
$ ./log_report.sh
Usage: ./log_report.sh <log_file>
```

## Sample Output

`./sysinfo.sh`:

```text
System Info
-----------
Hostname: ubuntu-dev
Date: 2026-11-26 08:54:54 UTC
User: alok

Disk usage (/):
Filesystem      Size  Used Avail Use% Mounted on
overlay        1007G  6.8G  949G   1% /

Memory usage:
               total        used        free      shared  buff/cache   available
Mem:           7.6Gi       743Mi       5.9Gi        26Mi       1.1Gi       6.9Gi
Swap:          2.0Gi          0B       2.0Gi

Top 5 processes by memory:
    PID USER     %MEM %CPU COMMAND
     32 alok      0.0  0.0 ps
     19 alok      0.0  0.0 bash
     21 alok      0.0  0.0 sysinfo.sh
      1 root      0.0  5.1 bash
     18 root      0.0  0.0 su

Saved to /home/alok/devseccops-assignments/assignment1-linux-scripting/sysinfo_2026-11-26.txt
```

`./log_report.sh sample.log`:

```text
Log report: sample.log
Total requests: 18
404 errors: 5

Top 3 IP addresses:
  192.168.1.24    (6 requests)
  203.0.113.45    (4 requests)
  10.0.2.15       (3 requests)
```

## Bonus

- `log_report.sh` prints a usage message and exits with status 1 if no file argument is passed.
- `sysinfo.sh` saves each run to a dated file (`sysinfo_YYYY-MM-DD.txt`) in addition to printing to stdout.
- Hourly cron line (`crontab -e`) to run `sysinfo.sh` automatically:

```cron
0 * * * * /home/alok/devseccops-assignments/assignment1-linux-scripting/sysinfo.sh >/dev/null 2>&1
```
