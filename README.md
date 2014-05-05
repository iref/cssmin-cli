CSSMin - CLI
============

This is simple wrapper around great [CSSMin](http://github.com/rgrove/cssmin) library.
It provides command line script for minifying css using CSSMin.

Instalation
-----------

Just install it from good old RubyGems.

```
gem install cssmin-cli
```

Usage
-----

1. To minify CSS source file run following command:

```
cssmin -s style.css -o style.min.css
```

This command will read CSS from `style.css`, minify css and store result to `style.min.css`

2. To minify inline CSS, run following command:

```
cssmin -i 'div {    border:   1px solid #ffff; margin: 0px   }' -o style.min.css
```

*Note*: If you don't provide output file, output is printed to standart output

To Contribute... :thumbsup:
---------------------

... just send me pull request. :man_with_turban:

Authors
-------

* Jan Ferko <julyloov@gmail.com>
