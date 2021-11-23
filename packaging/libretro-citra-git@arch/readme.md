## Building RetroArch Citra emulator library on Arch in Docker

This procedure will build an [Arch Linux](https://archlinux.org/) package of [Citra](https://citra-emu.org/) emulator for [RetroArch](https://www.retroarch.com/) from [LibRetro Upstream](https://github.com/libretro/citra) in Docker according to `Dockerfile` and extract the relevant library, providing a ready to install copy.

Run the automated procedure via `update` script:

```
# bash update.sh
```

or manually:

```
# bash build.sh
# bash run.sh
# bash extract.sh
# bash cleanup.sh
```

### Scripts

| Script | Description |
|:------:|:------------|
| build.sh | Generates the Docker build environment, pulls latest source and builds the packages |
| cleanup.sh | Removes image and prunes containers |
| extract.sh | Extracts the library from generated package |
| run.sh | Copies built package into host's `output` directory |
| update.sh | Runs through the procedure |

### Notes

* The LibRetro upstream is quite behind current Citra development.
* Cleanup might prune more than desired.
* Disable scripts from running via `update.sh` by removing executable file mode bits via `$ chmod -x script.sh`.
* This actually builds two packages, since `libretro-citra-git` depends on `libretro-core-info-git`.
* This build relies on latest state of Arch and the relevant `libretro` repositories:
  - In case there is an error check the AUR page of each package and news feed of Arch for any system relevant annoucements.
  - Failed builds ought to be visible on the AUR's `libretro-citra-git` package page and possibly upstream on [https://github.com/libretro/citra](https://github.com/libretro/citra).
* The generated library typically belongs into `~/.config/retroarch/cores/`.
* One can easily adjust a copy of `citra_libretro.info` to hold custom strings and build information, so that the local version is easily selectable and retained during updates.
