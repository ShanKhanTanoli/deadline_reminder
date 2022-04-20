<?php

namespace App\Helpers\Tenant;

use App\Models\User;
use Illuminate\Support\Facades\Auth;

class Tenant
{
    public static function Is()
    {
        if ($user = Auth::user()) {
            if ($user->role_id == 3 && $user->role == "tenant") {
                return $user;
            }
            return false;
        }
        return false;
    }

    public static function all()
    {
        return User::where('role_id', '3')
            ->where('role', 'tenant');
    }

    public static function count()
    {
        return self::all()->count();
    }
}
