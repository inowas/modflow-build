# Modflow binaries build with docker

This repository provides a docker-file to build the modflow files

The build script done with [pymake](https://github.com/modflowpy/pymake).

The binaries can be found in the following folder:

* ```/modflow-bin```

The following modflow versions are build:

* ```crt```
* ```gridgen```
* ```mf2000```
* ```mf2005```
* ```mf6```
* ```mflgr```
* ```mfnwt```
* ```mfusg```
* ```mfusg_gsi```
* ```mp6```
* ```mp7```
* ```mt3dms```
* ```mt3dusgs```
* ```sutra```
* ```swtv4```
* ```triangle```
* ```vs2dt```
* ```zbud6```
* ```zonbud3```
* ```zonbudusg```

## Possible usage in other docker-images

### COPY FROM-clause for other docker-repos (recommended)

```
COPY --from=inowas/modflow-build:latest /modflow-bin /usr/local/bin
```
