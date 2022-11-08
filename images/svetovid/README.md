# Svetovid image

This image is meant as a base for development environments that use svetovid
library. It's used on some mandatory programming courses on Department of
Mathematics and Informatics on Faculty of Sciences, University of Nvi Sad.

I personally maintain the library package (which is used here to install the
library) but you can download it yourself from the library website
[svetovid.org](https://svetovid.org).

This image also budnles the `svetorun` script which can be used to compile
Java programs with the svetovid library included with CLASSPATH variable and
to run the compiled programs. Check out the source
([svetorun.sh](./svetorun.sh)) to understand how it works.

The CLASSPATH variable is defined in the Dockerfile.

List of extra packages can be found in the file [extra-packages](./extra-packages).
