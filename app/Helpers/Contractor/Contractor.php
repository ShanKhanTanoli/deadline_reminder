<?php

namespace App\Helpers\Contractor;

use App\Models\User;
use Illuminate\Support\Facades\Auth;

class Contractor
{
    public static function Is()
    {
        if ($user = Auth::user()) {
            if ($user->role_id == 4 && $user->role == "contractor") {
                return $user;
            }
            return false;
        }
        return false;
    }

    public static function all()
    {
        return User::where('role_id', '4')
            ->where('role', 'contractor');
    }

    public static function count()
    {
        return self::all()->count();
    }
}
