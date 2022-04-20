<?php

namespace App\Helpers\Landlord;

use App\Models\User;
use Illuminate\Support\Facades\Auth;

class Landlord
{
    public static function Is()
    {
        if ($user = Auth::user()) {
            if ($user->role_id == 2 && $user->role == "landlord") {
                return $user;
            }
            return false;
        }
        return false;
    }

    public static function Find($landlord)
    {
        if ($user = User::find($landlord)) {
            if ($user->role_id == 2 && $user->role == "landlord") {
                return $user;
            }
            return false;
        }
        return false;
    }

    public static function all()
    {
        return User::where('role_id', '2')
            ->where('role', 'landlord');
    }

    public static function count()
    {
        return self::all()->count();
    }

    public static function tenants($landlord)
    {
        return User::where('role_id', '3')
            ->where('role', 'tenant')
            ->where('parent_landlord_id',$landlord);
    }

    public static function CountTenants($landlord)
    {
        return User::where('role_id', '3')
            ->where('role', 'tenant')
            ->count();
    }

    public static function FindTenant($landlord,$tenant)
    {
        if($user = self::Find($landlord)){
            if($tenant = self::tenants($user->id)
            ->where('id',$tenant)->first()){
                return $tenant;
            }else return false;
        }else return false;
    }
    
}
