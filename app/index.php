<?php
function genWelcome($name) {
    return "Welcome ". $name. "<br/ >";
}

if ($_POST["name"]) {
    if (preg_match("/[^A-Za-z'-]/", $_POST['name'])) {
        die("Name should be alpha");
    }

    $greeting = genWelcome($_POST["name"]);

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
