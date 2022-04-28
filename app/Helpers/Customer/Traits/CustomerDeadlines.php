<?php

namespace App\Helpers\Customer\Traits;

use App\Models\Deadline;

trait CustomerDeadlines

{
    /*Begin::Deadlines*/
    public static function Deadlines($customer)
    {
        return Deadline::where('customer_id', $customer);
    }

    public static function LatestDeadlinesPaginate($customer, $quantity)
    {
        return self::Deadlines($customer)
            ->latest()
            ->paginate($quantity);
    }

    public static function CountDeadlines($customer)
    {
        return self::Deadlines($customer)->count();
    }

    public static function FindDeadline($customer, $id)
    {
        if ($find = self::Find($customer)) {
            if ($Deadline = self::Deadlines($find->id)
                ->where('id', $id)->first()
            ) {
                return $Deadline;
            } else return false;
        } else return false;
    }

    public static function FindDeadlineBySlug($customer, $slug)
    {
        if ($find = self::Find($customer)) {
            if ($Deadline = self::Deadlines($find->id)
                ->where('slug', $slug)->first()
            ) {
                return $Deadline;
            } else return false;
        } else return false;
    }
    /*End::Deadlines*/
}
