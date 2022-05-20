<?php

namespace App\Http\Livewire\User\Dashboard\PlatformPlans;

use Livewire\Component;
use App\Helpers\Admin\Admin;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    public function render()
    {
        $prices = Admin::Prices(10);
        return view('livewire.user.dashboard.platform-plans.index')
            ->with(['prices' => $prices])
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Subscribe($price)
    {
        return redirect(route('UserSubscribe', ['price' => $price]));
    }

    public function Free($price)
    {
        //User
        $user = Auth::user();
        //Find price
        if ($find = Admin::FindPrice($price)) {
            //Create or get customer
            $user->createOrGetStripeCustomer();
            //Create Subscription
            $user->newSubscription(
                $find->product,
                $find->id
            )->create();
            //Success
            session()->flash('success', 'You are successfully subscribed');
            return redirect(route('UserPlatformPlans'));
        } else {
            session()->flash('error', 'Something went wrong');
            return redirect(route('UserPlatformPlans'));
        }
    }
}
