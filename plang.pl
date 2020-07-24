#!/usr/bin/perl
# quickly get interlanguage info from a Wikipedia page
#
# usage:
#   perl plang.pl Rye.wikipedia.html
use 5.010;

$/ = undef;
while (<>) {
  if (/<nav id="p\-lang.*?<ul class="vector-menu-content-list">(.*?)<\/ul>/s) {
    $list = $1;
    while ($list =~ /(<a href="https:\/\/(.*?)\..*?>(.*?)<\/a>)/g) {
      $lang = $2;
      $term = $3;
      say "$lang: $term" if $lang =~ /^(en|de|fr|es|zh)$/;
    }
  }
}
