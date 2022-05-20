<?php

namespace App\Http\Livewire\User\Dashboard\Subscriptions;

use Livewire\Component;
use Livewire\WithPagination;
use App\Helpers\User\User;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';

    public function render()
    {
        $subscriptions = User::SubscriptionsLatestPaginate(Auth::user(), 10);
        return view('livewire.user.dashboard.subscriptions.index')
            ->with(['subscriptions' => $subscriptions])
            ->extends('layouts.dashboard')
            ->section('content');
    }


    public function Cancel($name)
    {
        $user = Auth::user();
        if ($subscription = User::FindSubscription($user, $name)) {
            if (!$user->subscription($subscription->name)->ended()) {
                $user->subscription($subscription->name)->cancel();
                session()->flash('success', 'Canceled Successfully');
                return redirect(route('UserSubscriptions'));
            } else return session()->flash('error', 'Something went wrong');
        } else return session()->flash('error', 'Something went wrong');
    }

    public function Resume($name)
    {
        $user = Auth::user();
        if ($subscription = User::FindSubscription($user, $name)) {
            if (!$user->subscription($subscription->name)->ended()) {
                $user->subscription($subscription->name)->resume();
                session()->flash('success', 'Resumed Successfully');
                return redirect(route('UserSubscriptions'));
            } else return session()->flash('error', 'Something went wrong');
        } else return session()->flash('error', 'Something went wrong');
    }

    public function End($name)
    {
        $user = Auth::user();
        if ($subscription = User::FindSubscription($user, $name)) {
            if (!$user->subscription($subscription->name)->ended()) {
                $user->subscription($subscription->name)->cancelNow();
                session()->flash('success', "Canceled Succsessfully");
                return redirect(route('UserSubscriptions'));
            } else return session()->flash('error', 'Something went wrong');
        } else return session()->flash('error', 'Something went wrong');
    }
}
