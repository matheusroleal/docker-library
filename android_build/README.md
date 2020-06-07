# Android Build Image

This image has the objetive to be used on Android projects at CI/CD platforms like Bitbucket and GitLab, which uses docker containers. The contains all the necessary features used at a Android project. Those features are: 

- Gradle
- Android SDK Manager
- Fastlane
- Ruby
- NodeJS and Yarn (For projects that also contains React Native parts)

## What is Gradle?

Gradle is a build tool with a focus on build automation and support for multi-language development. If you are building, testing, publishing, and deploying software on any platform, Gradle offers a flexible model that can support the entire development lifecycle from compiling and packaging code to publishing web sites. Gradle has been designed to support build automation across multiple languages and platforms including Java, Scala, Android, C/C++, and Groovy, and is closely integrated with development tools and continuous integration servers including Eclipse, IntelliJ, and Jenkins.

## Useful Resources 

[Fastlane Setup](https://docs.fastlane.tools/getting-started/android/setup/)

[Pipeline Debug](https://confluence.atlassian.com/bitbucket/debug-your-pipelines-locally-with-docker-838273569.html)