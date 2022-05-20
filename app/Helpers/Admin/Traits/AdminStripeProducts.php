<?php

namespace App\Helpers\Admin\Traits;

use Exception;
use App\Helpers\Admin\Admin;
use App\Models\StripeConfiguration;

trait AdminStripeProducts
{
    /*Begin::Products*/
    public static function Products($load)
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            return $stripe->products->all(['limit' => $load]);
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }

    public static function ActiveProducts($load)
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            return $stripe->products
                ->all([
                    'limit' => $load,
                    'active' => true,
                ]);
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }

    public static function CountProducts()
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            return $stripe->products
                ->all()->count();
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }

    public static function CountActiveProducts()
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            return $stripe->products
                ->all(['active' => true])
                ->count();
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }

    public static function FindProduct($product)
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            return $stripe->products->retrieve(
                $product,
                []
            );
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }

    public static function ArchiveProduct($product)
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            return $stripe->products->update(
                $product,
                ['active' => false]
            );
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }

    public static function ActivateProduct($product)
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            return $stripe->products->update(
                $product,
                ['active' => true]
            );
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }

    public static function UpdateProduct($product, $name, $description)
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            return $stripe->products->update(
                $product,
                [
                    'name' => $name,
                    'description' => $description,
                ]
            );
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }
    /*End::Products*/

    /*Begin::Products with prices*/
    public static function AddOneTimeProductWithPrice($name, $description = null, $amount)
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            $product = $stripe->products->create([
                'name' => $name,
                'description' => $description,
            ]);
            return $stripe->prices->create([
                'unit_amount' => $amount * 100,
                'currency' => Admin::Currency(),
                'product' => $product->id,
            ]);
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }
    public static function AddRecurringProductWithPrice($name, $description = null, $amount, $interval_count, $interval)
    {
        try {
            $skey = StripeConfiguration::first()->secret_key;
            $stripe = new \Stripe\StripeClient(
                $skey
            );
            $product = $stripe->products->create([
                'name' => $name,
                'description' => $description,
            ]);
            return $stripe->prices->create([
                'unit_amount' => $amount * 100,
                'currency' => Admin::Currency(),
                'recurring' => [
                    'interval_count' => $interval_count,
                    'interval' => $interval,
                ],
                'product' => $product->id,
            ]);
        } catch (Exception $e) {
            return session()->flash('error', 'Something went wrong');
        }
    }
    /*End::Products with prices*/
}
