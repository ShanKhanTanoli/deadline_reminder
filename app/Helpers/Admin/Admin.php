<?php

namespace App\Helpers\Admin;

use App\Models\User;
use App\Models\Setting;
use App\Helpers\Currency\Currency;
use Illuminate\Support\Facades\Auth;
use App\Helpers\Admin\Traits\AdminStripePrices;
use App\Helpers\Admin\Traits\AdminStripeProducts;

class Admin
{
    use AdminStripePrices, AdminStripeProducts;

    public static function Is()
    {
        if ($user = Auth::user()) {
            if ($user->role_id == 1 && $user->role == "admin") {
                return $user;
            }
            return false;
        }
        return false;
    }

    /*Begin::Currency*/
    public static function Currency()
    {
        if ($settings = Setting::first()) {
            if ($settings->currency_id) {
                if ($currency = Currency::Find($settings->currency_id)) {
                    if ($currency->name) {
                        return $currency->name;
                    } else return "usd";
                } else return "usd";
            } else return "usd";
        } else return "usd";
    }
    /*End::Currency*/

    /*Begin::Settings*/
    public static function Settings($user)
    {
        return User::find($user)->settings;
    }
    /*End::Settings*/
}
