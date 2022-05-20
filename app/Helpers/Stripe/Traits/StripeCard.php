<?php

namespace App\Helpers\Stripe\Traits;

use Exception;
use Illuminate\Support\Str;

trait StripeCard
{

    //Subscribe Recurring with Stripe Cashier
    public static function CashierSubscribe($user, $card, $product, $price)
    {
        try {
            if ($stripe = self::Client()) {
                $pm = $stripe->paymentMethods->create([
                    'type' => 'card',
                    'card' => [
                        'number' => $card['card_number'],
                        'exp_month' => date('m', strtotime($card['card_expiry'])),
                        'exp_year' => date('Y', strtotime($card['card_expiry'])),
                        'cvc' => $card['card_cvc'],
                    ],
                ]);
                //Create or get customer
                $user->createOrGetStripeCustomer();
                //Update Payment Method
                $user->updateDefaultPaymentMethod($pm);
                //Sync with Stripe
                $user->updateDefaultPaymentMethodFromStripe();
                //Create Subscription
                $user->newSubscription(
                    $product,
                    $price
                )->create($pm);
                return session()->flash('success', 'Successfully Subscribed');
            } else return session()->flash('error', 'Something went wrong');
        } catch (\Stripe\Exception\CardException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\RateLimitException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\InvalidRequestException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\AuthenticationException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\ApiConnectionException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\ApiErrorException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (Exception $e) {
            return session()->flash('error', $e->getMessage());
        }
    }


    //Subscribe Recurring with Stripe Cashier
    public static function CashierSingleCharge($user, $card, $product, $amount)
    {
        try {
            if ($stripe = self::Client()) {
                $pm = $stripe->paymentMethods->create([
                    'type' => 'card',
                    'card' => [
                        'number' => $card['card_number'],
                        'exp_month' => date('m', strtotime($card['card_expiry'])),
                        'exp_year' => date('Y', strtotime($card['card_expiry'])),
                        'cvc' => $card['card_cvc'],
                    ],
                ]);
                //Create or get customer
                $user->createOrGetStripeCustomer();
                //Update Payment Method
                $user->updateDefaultPaymentMethod($pm);
                //Sync with Stripe
                $user->updateDefaultPaymentMethodFromStripe();
                //Create Single Charge
                $user->charge($amount, $pm);
                return session()->flash('success', 'Successfully Subscribed');
            } else return session()->flash('error', 'Something went wrong');
        } catch (\Stripe\Exception\CardException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\RateLimitException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\InvalidRequestException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\AuthenticationException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\ApiConnectionException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\ApiErrorException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (Exception $e) {
            return session()->flash('error', $e->getMessage());
        }
    }
}
