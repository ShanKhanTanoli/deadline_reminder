<?php

namespace App\Helpers\Admin\Traits;

use Exception;
use App\Models\StripeConfiguration;

trait AdminStripePrices
{
    /*Begin::Stripe Prices*/
    public static function Prices($load)
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            return $stripe->prices->all(['limit' => $load]);
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }

    public static function CountPrices()
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            return $stripe->prices
                ->all()->count();
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }

    public static function FindPrice($price)
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            return $stripe->prices->retrieve(
                $price,
                []
            );
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }
    /*End::Stripe Prices*/
}
