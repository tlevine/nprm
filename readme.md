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
library(devtools)
install_github('nprm', 'tlevine')
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
exports <- pi * 2
```

And then let's load it into another.
```r
# super.r

library(nprm)
tau <- nprm.require('./sub.r')
print(tau)
```

### Install a package from npm.
Let's use [treasury.io](https://npmjs.org/package/r-treasury.io)
in our R script.

Install it from the shell.

```sh
npm install r-treasury.io
```

```r
library(nprm)
treasury.io <- nprm.require('treasury.io')
treasury.io('SELECT * FROM t3c LIMIT 4')
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
{
  "name": "r-treasury.io",
  "version": "0.0.2",
  "description": "Submit a sql query to treasury.io and return a data.frame",
  "main": "main.r",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": "https://github.com/tlevine/r-treasury.io"
  },
  "keywords": [
    "r", "nprm"
  ],
  "author": {
    "name": "Thomas Levine"
  },
  "license": "BSD-2-Clause",
  "bugs": {
    "url": "https://github.com/tlevine/r-treasury.io/issues"
  },
}
```

(Prefix the package name with `r-` so people don't think it's
a node package.)

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
command-line interface.

* [10 Cool Things You Probably Didn’t Realize npm Could Do](http://blog.izs.me/post/1675072029/10-cool-things-you-probably-didnt-realize-npm-could-do)
* [task automation with npm run](http://substack.net/task_automation_with_npm_run)

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
    Given that R is not JavaScript, it doesn't necessarily make sense to
    implement this, but it might make sense to add more of the features
    (probably version [1.1.1](http://wiki.commonjs.org/wiki/Modules/1.1.1) though).
