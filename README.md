# Modflow binaries build with docker

This repository provides a docker-file to build the modflow files

The build script done with [pymake](https://github.com/modflowpy/pymake).

The binaries can be found in the following folders
 
* ```/modflow-bin```
* ```/usr/local/bin``` 


## Possible usage in other docker-images


### COPY FROM-clause for other docker-repos (recommended)

```
COPY --from=inowas/modflow-build:latest /modflow-bin /usr/local/bin
```

### Use as base-repo

```
FROM inowas/modflow-buil-latest
``` 
