<?php
/* 
 * Fetching the require files
 * */
require("lib/controller.php");
require("input/worktime.php");// we keep the worktime page seprate, make it esay to modify

// Declationaton of objects
foreach($EMPLOYEES as $i=>$emp){
	$arr[$i]=new employee;
	// value assignment, calling obj function
	$arr[$i]->set_var($emp['name'], $emp['shift_start'], $emp['shift_end'], $SETTINGS_nighttime_start, $SETTINGS_nighttime_end);
}
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>Assignment 3</title>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <meta name="generator" content="Geany 1.23.1" />
    <link rel="stylesheet" href="css/style.css" type="text/css" media="screen" /><!-- adding basic css -->
</head>
<body>    
    <div class="wrapper">
        <section class="container">
            <div class="paytable">
                <table>
					<tr>
						<th>Name</th>
						<th>Shift start</th>
						<th>Shift end</th>
						<th>Working hours</th>
						<th>Day hours</th>
						<th>Night hours</th>
					</tr>
					<?php 
					foreach($arr as $i=>$obj){ ?>
						<tr class="<?php if($i%2==0){echo 'even';} ?>">
							<td><?=$obj->name;?></td>
							<td><?=$obj->shift_start;?></td>
							<td><?=$obj->shift_end;?></td>
							<td><?=$obj->print_shift($obj->shift_start, $obj->shift_end);?></td>
							<td><?=$obj->print_day_hours($obj->shift_start, $obj->shift_end);?></td>
							<td><?=$obj->print_night_hours($obj->shift_start, $obj->shift_end);?></td>
						</tr>
					<?php } ?>
				</table>
            </div>
        </section>
    </div>
</body>
</html>



