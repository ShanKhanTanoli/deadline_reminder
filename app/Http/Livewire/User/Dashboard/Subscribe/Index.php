<?php

namespace App\Http\Livewire\User\Dashboard\Subscribe;

use Livewire\Component;
use App\Helpers\Admin\Admin;
use App\Helpers\Stripe\Stripe;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    public $price, $product, $card_holder_name, $card_number, $card_expiry, $card_cvc;

    public function mount($price)
    {
        //If Price found
        if ($find = Admin::FindPrice($price)) {
            $this->price = $find->id;
            $this->product = $find->product;
        } else {
            //If Platform plans not found
            session()->flash('error', 'Something went wrong');
            return redirect(route('UserPlatformPlans'));
        }
    }

    public function render()
    {
        return view('livewire.user.dashboard.subscribe.index')
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function PayNow()
    {
        $user = Auth::user();
        $card = $this->validate([
            'card_holder_name' => 'required|string',
            'card_number' => 'required|numeric',
            'card_expiry' => 'required|date',
            'card_cvc' => 'required|string',
        ]);

        //If Price found
        if ($find = Admin::FindPrice($this->price)) {
            //If Price is recurring
            if ($find->type == "recurring") {
                return Stripe::CashierSubscribe($user, $card, $this->product, $this->price);
            }
            //If Price is one_time
            if ($find->type == "one_time") {
                session()->flash('error', 'Something went wrong');
                return redirect(route('UserPlatformPlans'));
                //return Stripe::CashierSingleCharge($user, $card, $this->product, $find->unit_amount);
            }
            //If Something else
            session()->flash('error', 'Something went wrong');
            return redirect(route('UserPlatformPlans'));
        } else {
            //If Platform plans not found
            session()->flash('error', 'Something went wrong');
            return redirect(route('UserPlatformPlans'));
        }
    }
}
