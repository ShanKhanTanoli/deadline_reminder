<?php

namespace App\Helpers\Stripe\Traits;

use Exception;
use Illuminate\Support\Str;

trait StripeCard
{

    public static function CreateCardToken($holder_name, $number, $exp_month, $exp_year, $cvc)
    {
        try {
            if ($stripe = self::Client()) {
                $token = $stripe->tokens->create([
                    'card' => [
                        'name' => $holder_name,
                        'number' => $number,
                        'exp_month' => $exp_month,
                        'exp_year' => $exp_year,
                        'cvc' => $cvc,
                    ],
                ]);
                return $token;
            } else return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\CardException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\RateLimitException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\InvalidRequestException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\AuthenticationException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\ApiConnectionException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\ApiErrorException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (Exception $e) {
            return session()->flash('error', trans('alerts.error'));
        }
    }

    public static function RechargeVoucher($card_data, $amount, $currency, $voucher, $user_id)
    {
        try {
            if ($stripe = self::Client()) {

                $token = $stripe->tokens->create([
                    'card' => $card_data,
                ]);

                $charge = $stripe->charges->create([
                    'amount' => $amount,
                    'currency' => $currency,
                    'source' => $token->id,
                ]);


                $voucher->update([
                    'balance' => $voucher->balance + $charge->amount,
                ]);

                return session()->flash('success', 'Successfully recharged');
            } else return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\CardException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\RateLimitException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\InvalidRequestException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\AuthenticationException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (\Stripe\Exception\ApiConnectionException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\ApiErrorException $e) {
            return session()->flash('error', $e->getMessage());
        } catch (Exception $e) {
            return session()->flash('error', $e->getMessage());
        }
    }

    public static function ChargeClientCard($card, $amount, $currency, $application_fee_amount, $comission_percentage, $stripe_account, $voucher_id)
    {
        try {
            if ($stripe = self::Client()) {
                $token = $stripe->tokens->create([
                    'card' => $card,
                ]);
                $charge = $stripe->charges->create([
                    'amount' => $amount * 100,
                    'currency' => $currency,
                    'source' => $token->id,
                    'application_fee_amount' => $application_fee_amount * 100,
                ], ['stripe_account' => $stripe_account]);

                return true;
            } else return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\CardException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\RateLimitException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\InvalidRequestException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\AuthenticationException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\ApiConnectionException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\ApiErrorException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (Exception $e) {
            return session()->flash('error', trans('alerts.error'));
        }
    }

    //Subscribe with Stripe Cashier
    public static function CashierSubscribe($user, $card, $plan)
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
                    strtoupper(Str::random(10)),
                    $plan->plan_id
                )->create($pm);
                return session()->flash('success', trans('alerts.subscribed'));
            } else return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\CardException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\RateLimitException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\InvalidRequestException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\AuthenticationException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\ApiConnectionException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (\Stripe\Exception\ApiErrorException $e) {
            return session()->flash('error', trans('alerts.error'));
        } catch (Exception $e) {
            return session()->flash('error', trans('alerts.error'));
        }
    }
}
