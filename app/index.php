<?php
include 'db.php';

function gen_welcome($name)
{
    return "Welcome ". $name . ", your name was saved!" . "<br/>";
}

if ($_POST["name"]) {
    if (preg_match("/[^A-Za-z'-]/", $_POST['name'])) {
        die("Name should be alpha");
    }

    insert_name($db_conn, $_POST["name"]);

    $greeting = gen_welcome($_POST["name"]);

    echo $greeting;

    exit();
}
?>

<html>
  <body>
    <form action = "<?php $_PHP_SELF ?>" method = "POST">
      Name: <input type = "text" name = "name" />
      <input type = "submit" />
    </form>
  </body>
</html>
