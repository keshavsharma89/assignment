<?php
/*
 * ulelement is the class name that will retun the UL element
 * @html will contain the html element
 * @create_html will do all the math and create the UL as asked
 * @get_html will return the HTML element
 * */ 
class ulelement
{
    var $html; 
    
    function create_html()
    {
        // Start ul tag
        $html='<ul class="mainul">';
        
        // we will run the loop to get the data 1-100
        for($i=1; $i<=100; $i++){
            // this part is to place even class on all even li to add some good desing class
            if($i%2==0){
                $html.='<li class="even">';
            }else{
                $html.='<li>';
            }
            
            // switch cases will decide that which content need to placed in li
            switch(true){
                //  divisible by both 3 and 5, outputs string “foobar”
                case ($i%3==0 && $i%5==0) : 
                    $html.='foobar';
                    break;
                // divisible by 3, outputs string “foo”
                case ($i%3==0) : 
                    $html.='foo';
                    break;
                // divisible by 5, outputs string “bar”
                case ($i%5==0) : 
                    $html.='bar';
                    break;
                // if nothing then we will just put the number in output
                default : 
                    $html.=$i;
                    break;
            }
            
            $html.='</li>';
        }
        // ends our ul tag here
        $html.='</ul>';
        // placing HTML element in class variable
        $this->html = $html;
    }

    function get_html()
    {
        // calling the createhtml() function this will create the html element and place it in class variable html
        $this->create_html();
        // returning ul tag
        return $this->html;
    }
}

?>
