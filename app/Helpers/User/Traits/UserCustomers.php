<?php

namespace App\Helpers\User\Traits;

use App\Models\Customer;

trait UserCustomers

{
    /*Begin::Customers*/
    public static function Customers($user)
    {
        return Customer::where('user_id', $user);
    }

    public static function LatestCustomersPaginate($user, $quantity)
    {
        return self::Customers($user)
            ->latest()
            ->paginate($quantity);
    }

    public static function CountCustomers($user)
    {
        return self::Customers($user)->count();
    }

    public static function CountCustomersWithSubscription($user,$subscription)
    {
        return self::Customers($user)
            ->where('subscription_id', $subscription)
            ->count();
    }

    public static function FindCustomer($user, $id)
    {
        if ($find = self::Find($user)) {
            if ($customer = self::Customers($find->id)
                ->where('id', $id)->first()
            ) {
                return $customer;
            } else return false;
        } else return false;
    }

    public static function FindCustomerBySlug($user, $slug)
    {
        if ($find = self::Find($user)) {
            if ($customer = self::Customers($find->id)
                ->where('slug', $slug)->first()
            ) {
                return $customer;
            } else return false;
        } else return false;
    }
    /*End::Customers*/
}
