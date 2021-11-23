## Running Darktable on Ubuntu 20.04 LTS in Docker

This procedure will build an Ubuntu 20.04 LTS image and install `darktable` from official repositories in Docker according to `Dockerfile`. When run it will connect to a running `Xorg` server with `/tmp/output` mounted on both host and container, allowing for file transfer.

Run:

```
# bash build.sh
# bash run.sh
```

### Scripts

| Script | Description |
|:------:|:------------|
| build.sh | Builds the Ubuntu image, installs latest application package from repositories |
| run.sh | Runs the application |

