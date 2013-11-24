[npm]() is the best package manager,
so I wanted to use it for R packages.

## Installing
You'll need `npm` in order to install packages. npm comes
with node, so just [Install node]().

You'll need `r-npm` in order to create and load packages.
Install `r-npm` like you would any other R package.
```r
install.packages('npm')
```

## Crash course
Here are three common things you might want to do.

1. Include one file in another (like `source` but better).
2. Install a package from npm.
3. Write a package and publish it to npm.

### Include one file in another
Let's define [tau]() in one file.
```r
# sub.r

library(npm)
module$exports <- pi * 2
```

And then let's load it into another.
```r
# super.r

library(npm)
tau <- npm::require('./sub.r')
print(tau)
```

### Install a package from npm.



## Stuff
http://wiki.commonjs.org/wiki/Modules/1.1.1


## What's wrong with R packages?

* They're not outrageously simple to make.
* They encourage the writing of large packages.
* Dependencies aren't very explicit.

## Good things about R packages that this doesn't provide

* Help
* Examples
