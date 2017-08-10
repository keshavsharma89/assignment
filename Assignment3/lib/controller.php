<?php
/*
 * employee class will provide all the solutions for Assignemt 3
 * $name will be the name of the employee 
 * $shift_start & $shift_end will contain the shift start and end time
 * $night_start & $night_end will tell us what times we will use to determine the night
 * set_var() will set the values and initialise the object
 * set_time_format() will accept hours and retunr time in Hr:min, perfect to print
 * count_hour() will just count the total hours between starting point to end point
 * day_hours() will do the math and calculate how many hours of the start point to end point is during day
 * night_hours() do opposit to day_hours(), just tell the remaing hours after subtracting day time from total shift
 * print_shift(), print_day_hours(), print_night_hours() these functions will just show the same info, but in printable format
 * */
class employee
{
	// Variable declaration
	var $name, $shift_start, $shift_end, $night_start, $night_end;
	
	// Seting variable values for object
	function set_var($name, $start, $end, $night_start, $night_end)
	{
		$this->name=$name;
		$this->shift_start=$start;
		$this->shift_end=$end;
		$this->night_start=$night_start;
		$this->night_end=$night_end;
	}
	
	// time conversion to printable format
	function set_time_format($time)
	{	
		$hours = (int) $time;
		$minutes = fmod($time, 1) * 60;
		return $hours.':'.$minutes;
	}
	
	// accept 2 arguments start and end both will be time ie 22.00 or 7.30
	function count_hour($start , $end)
	{
		$ss=strtotime($start);
		$se=strtotime($end);
		if($se < $ss){
			$se=$se+(3600*24);
		}
		return (($se-$ss)/ 3600);
	}
	
	// will return hours that fall in day light
	function day_hours($sp, $ep)
	{
		$s_start=strtotime($sp);
		$s_end=strtotime($ep);
		// adding 24 hours in morning start time, we need this for the calculations 
		$m_start=strtotime($this->night_end)+(3600*24); 
		$m_end=strtotime($this->night_start);
		// flag if 1 we will know to remove complete night out of shift, In other words shift was started in day and ended next day.
		$deductnight=0;
		
		if($s_end < $s_start){
			$s_end=$s_end+(3600*24);
		}
		
		/* Covering all 5 posible cases here:
		 * 1. Start in day and end next day
		 * 2. Start in day and before night
		 * 3. Start in day and end in night
		 * 4. Start in night end next day
		 * 5. Start and end in night hours
		 * */
		if($s_start < $m_end){
			if($s_end >= $m_end){
				if($s_end < $m_start){
					$s_end=$m_end; // if shift end in night hours
				}else{
					$deductnight=1; // if shit start befor night time and end after next day
				}
			}
		}else{
			if($s_end < $m_start){
				return 0; // if shift start in night and end in night hours
			}elseif($s_start <= $m_start){
				$s_start=$m_start;	// if shift start in night but ends next day
			}
		}
		
		// Calculating day time hours, dividing by 3600 to converting mint to hours
		$day_hours=($s_end - $s_start)/ 3600;
		if($deductnight==1){
			// we need to remove complete night hours out of shif working hours
			$day_hours=$day_hours - ( $this->count_hour($this->night_start, $this->night_end) ) ;
		}
		return $day_hours;
	}
	
	// Just fetch total and day hours, subtract and return
	function night_hours($sp, $ep)
	{
		$totalshift=$this->count_hour($sp, $ep);
		$daytime=$this->day_hours($sp, $ep);
		return $totalshift-$daytime;
	}
	
	// Print function
	function print_shift($sp, $ep)
	{
		$time=$this->count_hour($sp, $ep);
		$time=$this->set_time_format($time);
		return $time;
	}
	
	// Print function
	function print_day_hours($sp, $ep)
	{
		$time=$this->day_hours($sp, $ep);
		$time=$this->set_time_format($time);
		return $time;
	}
	
	// Print function
	function print_night_hours($sp, $ep)
	{
		$time=$this->night_hours($sp, $ep);
		$time=$this->set_time_format($time);
		return $time;
	}
}
?>
