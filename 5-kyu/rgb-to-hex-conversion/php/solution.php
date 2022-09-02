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