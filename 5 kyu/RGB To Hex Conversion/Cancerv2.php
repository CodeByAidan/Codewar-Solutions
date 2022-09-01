<?php


// The rgb function is incomplete. Complete it so that passing in RGB decimal values will result in a hexadecimal representation being returned. Valid decimal values for RGB are 0 - 255. Any values that fall out of that range must be rounded to the closest valid value.
// Note: Your answer should always be 6 characters long, the shorthand with 3 will not work here.
// The following are examples of expected output values:

/* 
* rgb(255, 255, 255); // returns FFFFFF
* rgb(255, 255, 300); // returns FFFFFF
* rgb(0, 0, 0); // returns 000000
* rgb(148, 0, 211); // returns 9400D3
*/


// round the number to the closest value (255 or 0)
function roundToClosest($color)
{ 
    if($color > 255){
        return 255;
    }elseif($color < 0){
        return 0;
    }
    return $color; 
}

function rgb($r,$g,$b){

    $r = roundToClosest($r);
    $g = roundToClosest($g);
    $b = roundToClosest($b);

    return sprintf("%02X%02X%02X", $r, $g, $b);
}