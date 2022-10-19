# Node image

This image is meant as a simple base development environment for Node.js. It's expected from projects to have a well defined `package.json` file so the developer could depend only on things installed from there, no global packages are preinstalled.

For now I don't plan on adding other engines such as [Deno](https://deno.land) or [Bun](https://bun.sh) since I don't really use them at all. If at some point I start using them, I'll probably add them too.

List of extra packages can be found in the file [extra-packages](./extra-packages).
