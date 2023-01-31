<?php

function connect_to_db()
{
    mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

    $dbhost = 'localhost:3306';
    $dbuser = 'phpuser';
    $dbpass = 'secret';
    $dbname = 'testdb';
    $conn = mysqli_connect($dbhost, $dbuser, $dbpass, $dbname);

    if (! $conn) {
        die("Could not connect to database...");
    }

    return $conn;
}

function insert_name($conn, $name)
{
    $sql = "INSERT INTO person (name) VALUES ('$name')";
    $retval = mysqli_query($conn, $sql);

    if (!$retval) {
        die("Could not insert name...");
    }
}

$db_conn = connect_to_db();
