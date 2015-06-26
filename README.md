# Grafana package builder

This repo contains a docker file and script
that will build grafana packages in a centos6.6 docker container.

Can also be run locally using this:


````
./local_test
```

Which will create a `dist` subdirectory, then build and run the container,
mapping dist as the container's build target directory (which should
 result in a set of packages in dist).
