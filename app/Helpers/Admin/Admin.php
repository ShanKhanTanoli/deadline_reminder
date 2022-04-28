<?php

namespace App\Helpers\Admin;

use App\Models\User;
use Illuminate\Support\Facades\Auth;

class Admin
{
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

    /*Begin::Settings*/
    public static function Settings($user)
    {
        return User::find($user)->settings;
    }
    /*End::Settings*/
}