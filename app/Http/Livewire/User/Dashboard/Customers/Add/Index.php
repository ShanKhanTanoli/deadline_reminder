<?php

namespace App\Http\Livewire\User\Dashboard\Customers\Add;

use Exception;
use Livewire\Component;
use App\Models\Customer;
use App\Helpers\User\User;
use Illuminate\Support\Str;
use App\Helpers\Admin\Admin;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    public $name, $email, $address, $note;

    public $active_subscription,
        $user,
        $created_customers,
        $allowed_customers;

    public function mount()
    {
        if (Auth::user()->subscriptions()->active()->count() > 0) {
            //Assign User
            $this->user = Auth::user();
            //Active subscription
            $this->active_subscription = Auth::user()
                ->subscriptions()
                ->active()
                ->first();

            //Customers created with this subscription
            $this->created_customers = User::CountCustomersWithSubscription($this->user->id, $this->active_subscription->id);

            //Allowed Customers
            $allowed_customers = Admin::ProductAllowedCustomers($this->active_subscription->name);

            //If null then set as unlimited
            if ($allowed_customers == null) {
                $this->allowed_customers = "unlimited";
            } else {
                $this->allowed_customers = $allowed_customers;
            }

            //If allowed customers are unlimited
            if ($this->allowed_customers == "unlimited") {
                return true;
                //If allowed customers are available
            }elseif ($this->created_customers < $this->allowed_customers) {
                return true;
                //If nothing available
            } else {
                session()->flash('error', 'Your subscription allows you to create only ' . $this->allowed_customers . ' Customers.Please check your Subscription');
                return redirect(route('UserCustomers'));
            }

        } else {
            session()->flash('error', "You don't have an active subscription.");
            return redirect(route('UserCustomers'));
        }
    }

    public function render()
    {
        return view('livewire.user.dashboard.customers.add.index')
            ->extends('layouts.dashboard');
    }

    public function Add()
    {
        $validated = $this->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:customers,email',
            'address' => 'required|string',
            'note' => 'required|string',
        ]);
        try {
            $data = [
                'subscription_id' => $this->active_subscription->id,
                'user_id' => Auth::user()->id,
                'name' => $validated['name'],
                'email' => $validated['email'],
                'address' => $validated['address'],
                'note' => $validated['note'],
                'role_id' => 2,
                'role' => 'user',
                'slug' => strtoupper(Str::random(20)),
            ];

            //If allowed customers are unlimited
            if ($this->allowed_customers == "unlimited") {
                $merged = array_merge($data);
                Customer::create($merged);
                session()->flash('success', 'Added Successfully');
                return redirect(route('UserCustomers'));
                //If allowed customers are available
            } elseif ($this->created_customers < $this->allowed_customers) {
                $merged = array_merge($data);
                Customer::create($merged);
                session()->flash('success', 'Added Successfully');
                return redirect(route('UserCustomers'));
                //If nothing is available
            } else {
                session()->flash('error', 'Your subscription allows you to create only ' . $this->allowed_customers . ' Customers.Please check your Subscription');
                return redirect(route('UserCustomers'));
            }
        } catch (Exception $e) {
            return session()->flash('error', $e->getMessage());
        }
    }
}
