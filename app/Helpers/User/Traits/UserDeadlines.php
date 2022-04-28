<?php

namespace App\Helpers\User\Traits;

use App\Models\Deadline;

trait UserDeadlines

{
    /*Begin::Deadlines*/
    public static function Deadlines($user)
    {
        return Deadline::where('user_id', $user);
    }

    public static function LatestDeadlinesPaginate($user, $quantity)
    {
        return self::Deadlines($user)
            ->latest()
            ->paginate($quantity);
    }

    public static function CountDeadlines($user)
    {
        return self::Deadlines($user)->count();
    }

    public static function FindDeadline($user, $id)
    {
        if ($find = self::Find($user)) {
            if ($Deadline = self::Deadlines($find->id)
                ->where('id', $id)->first()
            ) {
                return $Deadline;
            } else return false;
        } else return false;
    }

    public static function FindDeadlineBySlug($user, $slug)
    {
        if ($find = self::Find($user)) {
            if ($Deadline = self::Deadlines($find->id)
                ->where('slug', $slug)->first()
            ) {
                return $Deadline;
            } else return false;
        } else return false;
    }
    /*End::Deadlines*/
}
