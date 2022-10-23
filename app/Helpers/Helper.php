<?php

namespace App\Helpers;

class Helper
{
    public static function StringReplace ()
    {
        $string = 'blah blarh bleh bleh blarh';
        $trans = array("blah" => "blerh", "bleh" => "blerh");
        return strtr($string,$trans);
    }
}
