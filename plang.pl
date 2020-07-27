#!/usr/bin/perl
# quickly get interlanguage info from a Wikipedia page
#
# usage:
#   perl plang.pl Rye.wikipedia.html
use 5.010;
use List::Util qw(any);

$/ = undef;
while (<>) {
  if (/<nav id="p\-lang.*?<ul class="vector-menu-content-list">(.*?)<\/ul>/s) {
    $list = $1;
    while ($list =~ /(<a href="https:\/\/(?<lang>.*?)\..*?" title="(?<term>.*?) – .*?>(?<language>.*?)<\/a>)/g) {
      say "$+{lang}: $+{term}" if any {$_ eq $+{lang}} qw/en fr de es zh/;
    }
  }
}
