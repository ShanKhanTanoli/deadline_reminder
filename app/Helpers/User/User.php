<?php

namespace App\Helpers\User;

use App\Helpers\User\Traits\UserSubscriptions;
use App\Helpers\User\Traits\UserCustomers;
use App\Helpers\User\Traits\UserDeadlines;
use App\Helpers\User\Traits\UserSettings;
use Illuminate\Support\Facades\Auth;
use App\Models\User as UserModel;

class User
{
    use UserCustomers,UserSettings,UserDeadlines,UserSubscriptions;

    /*Begin::User*/
    public static function Is()
    {
        if ($user = Auth::user()) {
            if ($user->role_id == 2 && $user->role == "user") {
                return $user;
            }
            return false;
        }
        return false;
    }

    public static function All()
    {
        return UserModel::where('role','user')
                    ->where('role_id',2);
    }

    public static function Count()
    {
        return self::All()->count();
    }

    public static function LatestPaginate($quantity)
    {
        return self::All()->latest()
        ->paginate($quantity);
    }

    public static function Find($user)
    {
        if ($user = UserModel::find($user)) {
            if ($user->role_id == 2 && $user->role == "user") {
                return $user;
            }else return false;
        }else return false;
    }
    /*End::User*/

}
