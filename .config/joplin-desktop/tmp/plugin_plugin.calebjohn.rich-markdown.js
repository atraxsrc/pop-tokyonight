/*!
 * word-wrap <https://github.com/jonschlinkert/word-wrap>
 *
 * Copyright (c) 2014-2017, Jon Schlinkert.
 * Released under the MIT License.
 */
e.exports=function(e,t){if(null==e)return e;var a=(t=t||{}).width||50,n="string"==typeof t.indent?t.indent:"  ",i=t.newline||"\n"+n,s="function"==typeof t.escape?t.escape:o,r=".{1,"+a+"}";!0!==t.cut&&(r+="([\\s​]+|$)|[^\\s​]+?([\\s​]+|$)");var l=new RegExp(r,"g"),d=n+(e.match(l)||[]).map((function(e){return"\n"===e.slice(-1)&&(e=e.slice(0,e.length-1)),s(e)})).join(i);return!0===t.trim&&(d=d.replace(/[ \t]*$/gm,"")),d}}]);