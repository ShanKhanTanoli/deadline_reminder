<?php

namespace App\Helpers\User\Traits;

use App\Models\User;
use App\Helpers\Currency\Currency;

trait UserSettings

{
    /*Begin::Settings*/
    public static function Settings($user)
    {
        return User::find($user)->settings;
    }
    /*End::Settings*/

    /*Begin::Business Details*/
    public static function BusinessDetails($user)
    {
        return User::find($user)->details;
    }
    public static function Currency($user)
    {
        if ($details = User::find($user)->details) {
            if ($currency = Currency::Find($details->currency_id)) {
                return $currency->name;
            } else return "USD";
        } else return "USD";
    }
    /*End::Business Details*/
}
