<?php

namespace App\Http\Livewire\User\Dashboard\Deadlines\Add;

use Exception;
use Livewire\Component;
use App\Models\Deadline;
use App\Helpers\User\User;
use Illuminate\Support\Str;
use App\Helpers\Admin\Admin;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    public
        $check_reminder,
        $customer_id,
        $name,
        $date,
        $amount,
        $renew_state,
        $type_of_renew,
        $note,
        $reminder;


    public $active_subscription, $user, $created_deadlines;

    public function mount()
    {
        //If have an active subscription
        if (Auth::user()->subscriptions()->active()->count() > 0) {
            //Assign User
            $this->user = Auth::user();
            //Active subscription
            $this->active_subscription = Auth::user()
                ->subscriptions()
                ->active()
                ->first();

            //Deadlines created with this subscription
            $this->created_deadlines = User::CountDeadlinesWithSubscription($this->user->id, $this->active_subscription->id);

            //Allowed Deadlines
            $allowed_deadlines = Admin::ProductAllowedDeadlines($this->active_subscription->name);
            if ($this->created_deadlines >= $allowed_deadlines) {
                session()->flash('error', 'Your subscription allows you to create only ' . $allowed_deadlines . ' Deadlines for each Customer.Please check your Subscription');
                return redirect(route('UserDeadlines'));
            }
        } else {
            session()->flash('error', "You don't have an active subscription.");
            return redirect(route('UserDeadlines'));
        }
    }

    public function render()
    {
        return view('livewire.user.dashboard.deadlines.add.index')
            ->extends('layouts.dashboard');
    }

    public function Add()
    {
        $msg = [
            'check_reminder.required' => 'Select Reminder',
            'check_reminder.in' => 'Select Reminder',
        ];
        $validated = $this->validate([
            'customer_id' => 'required|numeric',
            'name' => 'required|string',
            'date' => 'required|date',
            'amount' => 'required|numeric',
            'renew_state' => 'required|string|in:to_renew,waiting_cash,renewed,deleted',
            'type_of_renew' => 'required|string|in:domain,hosting,hosting_email,wpml,privacy_cookie,other',
            'note' => 'required|string',
            'check_reminder' => 'required|in:1',
            'reminder' => 'required|string|in:30_days_before,60_days_before',
        ], $msg);

        try {
            //Allowed Deadlines
            $allowed_deadlines = Admin::ProductAllowedDeadlines($this->active_subscription->name);
            if ($this->created_deadlines < $allowed_deadlines) {
                $data = [
                    'subscription_id' => $this->active_subscription->id,
                    'user_id' => Auth::user()->id,
                    'slug' => strtoupper(Str::random(20)),
                ];
                Deadline::create(array_merge($data, $validated));
                session()->flash('success', 'Added Successfully');
            } else {
                session()->flash('error', 'Your subscription allows you to create only ' . $allowed_deadlines . ' Deadlines for each Customer.Please check your Subscription');
                return redirect(route('UserDeadlines'));
            }
            return redirect(route('UserDeadlines'));
        } catch (Exception $e) {
            return session()->flash('error', $e->getMessage());
        }
    }
}
