## Lean CV

A modern tabular looking curriculum vitae LaTeX class.

### Example

In the [examples](https://github.com/SergioRAgostinho/leancv/tree/master/examples) folder you'll find a template showcasing how to use this class. It makes use of [UseLATEX](https://gitlab.kitware.com/kmorel/UseLATEX) and [CMake](https://cmake.org/) to handle all LaTeX invocations.

```
$ cd leancv/examples
$ mkdir build
$ cd build
$ cmake ..
$ make
```

This will generate your new cv document inside the `build` folder you just created. The output should look like [this](https://github.com/SergioRAgostinho/leancv/blob/master/examples/cv.pdf).


### Required Packages

- geometry
- longtable
- xparse
- amssymb
- helvet
- xcolor
- graphicx
- tikz
- hyperref

### Issues and Proposals

I'm an absolute newbie at writing LaTeX classes/packages so I'm sure there are a number of things that can be improved. If you find something please open an issue suggesting changes and possibly even a pull request with your proposal.

### Motivation

After many years of doing things in Microsoft Word and being sad about having to store every new version as a different file I decided to invest some time in moving things into LaTeX. Now I can manage my different CV versions with git. I call that a life improvement. :+1:
