# Docker package building and runtime

## Image processing modular blocks (IMB)

Upstream repository: [https://github.com/em-er-es/imb](https://github.com/em-er-es/imb)

The repository is expected to be inside `imb-git` directory and should be pulled automatically when building the image. Alternatively a Git bundle `imb.git` can be provided and the `Dockerfile` will take care of it, however this option needs to be selected through uncommenting, while commenting out the `RUN` call to use remote repository.

## Docker

### Requirements

The provided docker files are written for Ubuntu specifically, but this could be adapted to further distributions.

Install Docker:

```
# apt install docker
```

### Scripts

Select the desired Ubuntu version to use for building via symlinking:

```
$ ln -sv Dockerfile.ubuntu1804 Dockerfile
$ ln -sv Dockerfile.ubuntu2004 Dockerfile
```

To generate appropriate images for packaging run:

```
# bash update.sh
```

or do it manually:

```
# bash build.sh
# bash package.sh
```

This will build the image `imb-git`, compile the application and package it with `dpkg-buildpackage` and copy the result into `output` directory.

To process images in `input` directory and save them into `output` directory run:

```
# bash run.sh
```

To adjust processing parameters, edit `docker-run.sh` script, which iterates the input images to the locally docker build binary.

### Packaging

Build the `imb-git` image:

```
# docker build -t imb-git .
```

Run packaging routine on `imb-git` image:

```
# docker run -it imb-git:latest
```

This will result in `imb_<package-version>-<git-version>~ubuntu_<architecture>.deb` inside `output` directory.

### Runtime

In order to use the runtime image `imb-git-runtime` the previous `imb-git` must be build first.

Running building and runtime scripts will be sufficient to process files in `input`:

```
# bash build.sh
# bash run.sh
```

## Usage

```
Usage: build/bin/imb [-acCdDhmrRv] -i input -o output
	-a	Scan lines
	-c	Color mixing
	-C	Continuous image check
	-d/D	Enable/Disable input and output comparison display
	-h	This help
	-i	Input image (default: input.png)
	-m	VIC II model selector (default: latest)
	-o	Output image (default: output.png)
	-r/R	Enable/Disable RGB comparison (default: enabled)
	-v	Verbose
```
