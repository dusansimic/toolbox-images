# Eclipse Java image

This image is meant as a development environment for Eclipse which is often used on Department of Mathematics and Informatics on Faculty of Sciences, University of Novi Sad. It could also be used as a base image for some specific development environment that needs to be used on some courses.

The Eclipse package that it contains is not one packaged and maintained by Fedora since they removed theirs but me on copr. I decided to use it instead of the Flatpak version because then I have more control over what JDK-s are used and what libraries are used. I needed that since there were some issues with libraries used in computer graphics courses.

List of extra packages can be found in the file [extra-packages](./extra-packages).
