<?php

namespace App\Helpers\User\Traits;


trait UserSubscriptions
{

    /*Begin::Subscriptions*/
    public static function Subscriptions($business)
    {
        return $business->subscriptions();
    }

    public static function SubscriptionsLatestPaginate($business, $quantity)
    {
        return self::Subscriptions($business)
            ->latest()
            ->paginate($quantity);
    }

    public static function CountSubscriptions($business)
    {
        return self::Subscriptions($business)->count();
    }

    public static function FindSubscription($business, $subscription)
    {
        return self::Subscriptions($business)
            ->where('name', $subscription)
            ->first();
    }
    /*End::Subscriptions*/
}
