<?php

namespace App\Helpers;

use Illuminate\Support\Facades\Auth;

class Redirect
{
    public static function ToDashboard()
    {
        if ($user = Auth::user()) {
            if ($user->role_id == 1 && $user->role == "admin") {
                return route('AdminDashboard');
            } elseif ($user->role_id == 2 && $user->role == "user") {
                return route('UserDashboard');
            } else return route('login');
        }
        return route('login');
    }
}
