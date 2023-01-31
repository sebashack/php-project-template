<?php

define("TANT", 50);

$greeting1 = "Welcome again";
$greeting2 = "Hello again";
$longGreeting =<<<_STR_
This is a long string about many things
I want to say because it is long.
_STR_;

if (3 == 2 + 1) {
    print(TANT);
    print("<p>$longGreeting</p>");
} else {
    print("<p>$greeting2</p>");
}
