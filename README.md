# hyperscripts

some functions to create cool one liners in livescript.

use it as a CLI tool!

`npm i livescript -g`

create an alias in your ~/.bashrc profile like:

`alias asd="lsc --require 'path/to/your/local/clone/of/this/repo/hyper-scripts.js' -e"`

then create or use some functions and combine them to powerfull one liners in livescript!

Examples:

`_.each [1 to 10], (r)-> copy 'README.md', "README(#{r}).md"`

saves the html content of http://example.com into current working directory
`_sweb 'example.com'`