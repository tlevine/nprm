node-packaged R modules
======
[npm]() is the best package manager,
so let's use it for R packages.

## Installing
You'll need npm in order to install packages. npm comes
with node, so just [Install node]().

You'll need nprm in order to create and load packages.
Install nprm like you would any other R package.
```r
install.packages('nprm')
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

library(nprm)
module.exports <- pi * 2
```

And then let's load it into another.
```r
# super.r

library(nprm)
tau <- nprm.require('./sub.r')
print(tau)
```

### Install a package from npm.
Let's use [foobar](r-foobar)
in our R script.
```r
library(nprm)
foobar <- nprm.require('foobar')
foobar$baz()
```

### Write a package and publish it to npm.
To publish something to npm, you just need to do this.

1. Write a `package.json` file.
2. Make an account on npm.
3. Run `npm publish`.

Get a basic `package.json` by running `npm init`.

```sh
npm init
```

The main thing you'll need to add is the dependencies.
In the case of the previous script, your `package.json`
might look like this.

```json
{"foo":"bar"}
```

Then make an account and run `npm publish`.

```sh
npm publish
```

Since it's so easy to write packages, you can actually
do this for pretty much anything that you write as long
as it doesn't contain any secrets.

## Other stuff
Now that you're using npm, there are a lot of way-cooler
things that you can do, pretty much all from the npm
command-line interface. Read about that
[here]().

## What's wrong with R packages?

* They're not outrageously simple to make.
* They encourage the writing of large packages.
* Dependencies aren't very explicit.

## Good things about R packages that this doesn't provide

* Help
* Examples

## Things that npm has that nprm doesn't provide

* `npm init` detects required packages. This doesn't.
* npm implements
    [CommonJS modules 1.0](http://wiki.commonjs.org/wiki/Modules/1.0).
    It might be cool to implement more of this
    (probably version [1.1.1](http://wiki.commonjs.org/wiki/Modules/1.1.1)),
    but nprm just uses `module.exports` right now.
