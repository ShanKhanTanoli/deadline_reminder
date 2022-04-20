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
            } elseif ($user->role_id == 2 && $user->role == "landlord") {
                return route('LandlordDashboard');
            } elseif ($user->role_id == 3 && $user->role == "tenant") {
                return route('TenantDashboard');
            } elseif ($user->role_id == 4 && $user->role == "contractor") {
                return route('ContractorDashboard');
            } else return route('login');
        } else return route('login');
    }
}
