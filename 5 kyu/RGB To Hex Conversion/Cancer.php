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

class Color
{
    /** int $red */
    public $red;

    /** int $green */
    public $green;

    /** int $blue */
    public $blue;

    public function __construct($red, $green, $blue)
    {
        $this->red = $red;
        $this->green = $green;
        $this->blue = $blue;
    }

    /**
     * Method convertToHex
     * Covert given color to string #RRGGBB
     */
    public static function convertToHex(Color $color)
    {
        $red = dechex($color->red);
        if (strlen($red) < 2) $red = '0' . $red; // check string length and add zero if needed

        $green = dechex($color->green);
        if (strlen($green) < 2) $green = '0' . $green;

        $blue = dechex($color->blue);
        if (strlen($blue) < 2) $blue = '0' . $blue;

        return '#' . $red . $green . $blue;
    }

    /**
     * Method convertToRGB
     * Convert given color string back to RGB color values
     */
    public static function convertToRGB($hex)
    {
        $hex = ltrim($hex, "#");

        $red = hexdec(substr($hex, 0, 2));
        $green = hexdec(substr($hex, 2, 2));
        $blue = hexdec(substr($hex, 4, 2));

        return new Color($red, $green, $blue);
    }
}
