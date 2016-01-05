# docker-android-sdk

A base image with the Android SDK and build tools installed. Allows you to build your Android app.

## Example 

To build the app in the curent directory, you 

```shell
docker run -t -i -v $PWD:/myapp -w /myapp chetbox/docker-android-sdk gradle build
```

You can specify the version of the Android SDK you want to use by specifying a different tag.

e.g. `chetbox/docker-android-sdk:23.0.1`
