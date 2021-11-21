# Docker runtime

## Mask pattern filter

Upstream repository: [https://github.com/em-er-es/mask-pattern](https://github.com/em-er-es/mask-pattern)

Make sure files `mask.py` and `docker-run.sh` are in the same directory as `Dockerfile`, `build.sh` and `run.sh`. Furthermore external mask files like `mask.png` are preferable to internal masks.

## Requirements

```
# apt install docker
```

## Docker

The provided docker file is written to use Ubuntu image specifically.

### Scripts

To generate appropriate image for runtime run:

```
# bash build.sh
```

This will build the image `mask-pattern-git`.

To process images in `input` directory and save them into `output` directory run:

```
# bash run.sh
```

To adjust processing parameters, edit `docker-run.sh` script, which iterates the input images to the locally docker build binary. The mask file `mask.png` should to be placed inside `input` directory, so that it can be passed on into the Docker container.

## Usage

```
Usage: mask.py [-h] [-bt BINARYTHRESHOLD <0-255><!1>] [-i FILENAMEINPUT]
               [-im INTERNALMASK] [-in INVERT] [-g GRAYSCALE] [-f FILTERING]
               [-m FILENAMEMASK] [-o FILENAMEOUTPUT]
               [-sc SEPARATEMASKCHANNELS] [-sm SCALEMASK]
               [-so OUTPUTSELECTOR <0-b4>] [-sf SCALEFIT]
               [-t THRESHOLD <-100-255><!-85>] [-si SHOWIMAGES <0-b4><!0>]
               [-s] [-sp <SAVEPATH><!/tmp>] [-v VERBOSE]

Perform basic image processing on input by using a mask to generate output.

optional arguments:
  -h, --help            show this help message and exit
  -bt BINARYTHRESHOLD <0-255><!1>, --binary-threshold BINARYTHRESHOLD <0-255><!1>
                        Threshold for binary filtering
  -i FILENAMEINPUT, --input FILENAMEINPUT
                        Input image
  -im INTERNALMASK, --internal-mask INTERNALMASK
                        Internal mask
  -in INVERT, --invert INVERT
                        Invert input, mask, output
  -g GRAYSCALE, --grayscale GRAYSCALE
                        Convert color space of input, mask, output
  -f FILTERING, --filter FILTERING
                        Use the mask as a filter
  -m FILENAMEMASK, --mask FILENAMEMASK
                        Mask image
  -o FILENAMEOUTPUT, --output FILENAMEOUTPUT
                        Output image
  -sc SEPARATEMASKCHANNELS, --separate-mask-channels SEPARATEMASKCHANNELS
                        Separate mask channels
  -sm SCALEMASK, --scale-mask SCALEMASK
                        Scale mask
  -so OUTPUTSELECTOR <0-b4>, --select-output OUTPUTSELECTOR <0-b4>
                        Select output: 0 -- Input; 1 -- !Output; 2 -- Output
                        mask; 3 -- Mask; 4 -- Filter; * -- Output without
                        scaling
  -sf SCALEFIT, --scale-to-fit SCALEFIT
                        Scale mask to fit
  -t THRESHOLD <-100-255><!-85>, --threshold THRESHOLD <-100-255><!-85>
                        Threshold for mask
  -si SHOWIMAGES <0-b4><!0>, --show-images SHOWIMAGES <0-b4><!0>
                        Show images
  -s, --save-images     Save images
  -sp <SAVEPATH><!/tmp>, --save-path <SAVEPATH><!/tmp>
                        Definitions path for generated images, implies save
                        images option
  -v VERBOSE, --verbose VERBOSE
                        Set verbose level
```
