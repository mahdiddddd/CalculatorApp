#!/usr/bin/env sh
#
# Simple Gradle wrapper that downloads and runs Gradle 8.3.
#
VERSION=8.3
DIR="$( cd "$( dirname "$0" )" && pwd )"
WRAPPER_JAR="$DIR/gradle/wrapper/gradle-wrapper.jar"
DISTRIBUTION_URL="https://services.gradle.org/distributions/gradle-${VERSION}-bin.zip"

if [ ! -f "$WRAPPER_JAR" ]; then
  echo "Downloading Gradle $VERSION..."
  mkdir -p "$DIR/gradle/wrapper"
  curl -sSL "$DISTRIBUTION_URL" -o "$DIR/gradle/wrapper/gradle-${VERSION}-bin.zip"
  unzip -oq "$DIR/gradle/wrapper/gradle-${VERSION}-bin.zip" -d "$DIR/gradle/wrapper"
  mv "$DIR/gradle/wrapper/gradle-${VERSION}/lib/gradle-launcher-${VERSION}.jar" "$WRAPPER_JAR"
  rm -rf "$DIR/gradle/wrapper/gradle-${VERSION}" "$DIR/gradle/wrapper/gradle-${VERSION}-bin.zip"
fi

java -jar "$WRAPPER_JAR" "$@"