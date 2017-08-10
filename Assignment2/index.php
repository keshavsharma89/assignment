<?php
    // we will include controller file to get the defination for the class ulelement
    require("lib/controller.php");
    // Creating the object 
    $ulele = new ulelement;
    // calling functiont and assign HTML element to the variable
    $ul=$ulele->get_html();
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Assignment 2</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta name="generator" content="Geany 1.23.1" />
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" /><!-- adding basic css -->
</head>
<body>    
    <div class="wrapper">
        <section class="container">
            <div class="paytable">
                <?php echo $ul;?>
            </div>
        </section>
    </div>
</body>
</html>
