# Gradle Android

[![Build Status](https://travis-ci.org/wiktor-k/gradle-android.svg?branch=master)](https://travis-ci.org/wiktor-k/gradle-android)

Builds project in `/opt/workspace` using Gradle and tools for Android SDK level 23.

[SDK-LIC]: https://developer.android.com/studio/terms.html

Use this command to build a project:

    docker run -it -v $(pwd):/opt/workspace wiktork/gradle-android

The output apk will be in `app/build/outputs/apk` directory.

This image on [Docker Hub][HUB].

[HUB]: https://hub.docker.com/r/wiktork/gradle-android

## Cache

 Note that because Gradle is being run as a `CMD` its actions are not cached. It is advised to create a custom Docker image using this image as a `FROM` and run Gradle from a regular `RUN` instruction for better performance.

## Legal

Note that you **must** accept [Android SDK Licence Agreement][SDK-LIC] to use this image.
