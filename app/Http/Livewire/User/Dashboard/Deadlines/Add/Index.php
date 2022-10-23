<?php

namespace App\Http\Livewire\User\Dashboard\Deadlines\Add;

use Exception;
use Livewire\Component;
use App\Models\Deadline;
use App\Helpers\User\User;
use Illuminate\Support\Str;
use App\Helpers\Admin\Admin;
use App\Mail\Reminder;
use App\Models\Customer;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

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
        $private_note,
        $reminder;


    public $active_subscription,
        $user,
        $created_deadlines,
        $allowed_deadlines;

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
            //If null then set as unlimited
            if ($allowed_deadlines == null) {
                $this->allowed_deadlines = "unlimited";
            } else {
                $this->allowed_deadlines = $allowed_deadlines;
            }
            //If allowed deadlines are unlimited
            if ($this->allowed_deadlines == "unlimited") {
                return true;
                //If allowed deadlines are available
            } elseif ($this->created_deadlines < $this->allowed_deadlines) {
                return true;
                //If nothing available
            } else {
                session()->flash('error', 'Your subscription allows you to create only ' . $allowed_deadlines . ' for each Customer.Please check your Subscription');
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
            'note.required' => 'Please add a public note.',
        ];
        $validated = $this->validate([
            'customer_id' => 'required|numeric',
            'name' => 'required|string',
            'date' => 'required|date',
            'amount' => 'required|numeric',
            'renew_state' => 'required|string|in:to_renew,waiting_cash,renewed,deleted',
            'type_of_renew' => 'required|string|in:domain,hosting,hosting_email,wpml,privacy_cookie,other',
            'note' => 'required|string',
            'private_note' => 'required|string',
            'check_reminder' => 'required|in:1',
            'reminder' => 'required|string|in:30_days_before,60_days_before',
        ], $msg);

        try {
            //If allowed customers are unlimited
            if ($this->allowed_deadlines == "unlimited") {

                $data = [
                    'subscription_id' => $this->active_subscription->id,
                    'user_id' => Auth::user()->id,
                    'slug' => strtoupper(Str::random(20)),
                ];
                //Create Deadline
                Deadline::create(array_merge($data, $validated));

                //Assign Data
                $this->customer_id = $validated['customer_id'];
                $this->date = $validated['date'];
                $this->amount = $validated['amount'];
                $this->note = $validated['note'];
                $this->renew_state = $validated['renew_state'];
                $this->type_of_renew = $validated['type_of_renew'];
                $this->reminder = $validated['reminder'];

                //Get Reminder Values
                if ($this->reminder == "30_days_before") {
                    $this->reminder = 30;
                }
                if ($this->reminder == "60_days_before") {
                    $this->reminder = 60;
                }

                //Send Email
                dispatch(function () {

                    //Get Renew State Values
                    if ($this->renew_state == "to_renew") {
                        $this->renew_state = "To Renew";
                    }
                    if ($this->renew_state == "waiting_cash") {
                        $this->renew_state = "Waiting for Cash";
                    }
                    if ($this->renew_state == "renewed") {
                        $this->renew_state = "Renewed";
                    }
                    if ($this->renew_state == "deleted") {
                        $this->renew_state = "Deleted";
                    }

                    //Get Type of Renew Values
                    if ($this->type_of_renew == "domain") {
                        $this->type_of_renew = "Domain";
                    }
                    if ($this->type_of_renew == "hosting") {
                        $this->type_of_renew = "Hosting";
                    }
                    if ($this->type_of_renew == "hosting_email") {
                        $this->type_of_renew = "Hosting Email";
                    }
                    if ($this->type_of_renew == "wpml") {
                        $this->type_of_renew = "WPML";
                    }
                    if ($this->type_of_renew == "privacy_cookie") {
                        $this->type_of_renew = "Privacy Cookie";
                    }
                    if ($this->type_of_renew == "other") {
                        $this->type_of_renew = "Other";
                    }
                    //Find Customer
                    $customer = Customer::find($this->customer_id);
                    //Data to send
                    $data = [
                        'name' => $customer->name,
                        'type_of_renew' => $this->type_of_renew,
                        'renew_state' => $this->renew_state,
                        'date' => date('d-M-Y'),
                        'note' => $this->note,
                        'amount' => $this->amount . ' ' . strtoupper(Admin::Currency()),
                    ];
                    //Mail To
                    Mail::to($customer->email)
                        ->send(new Reminder($data,Auth::user()->id));
                    //Delay
                })->delay(now()->addDays($this->reminder));

                session()->flash('success', 'Added Successfully');
                return redirect(route('UserDeadlines'));
            } elseif ($this->created_deadlines < $this->allowed_deadlines) {

                $data = [
                    'subscription_id' => $this->active_subscription->id,
                    'user_id' => Auth::user()->id,
                    'slug' => strtoupper(Str::random(20)),
                ];

                //Create Deadline
                Deadline::create(array_merge($data, $validated));

                //Assign Data
                $this->customer_id = $validated['customer_id'];
                $this->date = $validated['date'];
                $this->amount = $validated['amount'];
                $this->renew_state = $validated['renew_state'];
                $this->type_of_renew = $validated['type_of_renew'];
                $this->reminder = $validated['reminder'];

                //Get Reminder Values
                if ($this->reminder == "30_days_before") {
                    $this->reminder = 30;
                }
                if ($this->reminder == "60_days_before") {
                    $this->reminder = 60;
                }

                //Send Email
                dispatch(function () {

                    //Get Renew State Values
                    if ($this->renew_state == "to_renew") {
                        $this->renew_state = "To Renew";
                    }
                    if ($this->renew_state == "waiting_cash") {
                        $this->renew_state = "Waiting for Cash";
                    }
                    if ($this->renew_state == "renewed") {
                        $this->renew_state = "Renewed";
                    }
                    if ($this->renew_state == "deleted") {
                        $this->renew_state = "Deleted";
                    }

                    //Get Type of Renew Values
                    if ($this->type_of_renew == "domain") {
                        $this->type_of_renew = "Domain";
                    }
                    if ($this->type_of_renew == "hosting") {
                        $this->type_of_renew = "Hosting";
                    }
                    if ($this->type_of_renew == "hosting_email") {
                        $this->type_of_renew = "Hosting Email";
                    }
                    if ($this->type_of_renew == "wpml") {
                        $this->type_of_renew = "WPML";
                    }
                    if ($this->type_of_renew == "privacy_cookie") {
                        $this->type_of_renew = "Privacy Cookie";
                    }
                    if ($this->type_of_renew == "other") {
                        $this->type_of_renew = "Other";
                    }
                    //Find Customer
                    $customer = Customer::find($this->customer_id);
                    //Data to send
                    $data = [
                        'name' => $customer->name,
                        'type_of_renew' => $this->type_of_renew,
                        'renew_state' => $this->renew_state,
                        'note' => $this->note,
                        'date' => date('d-M-Y'),
                        'amount' => $this->amount . ' ' . strtoupper(Admin::Currency()),
                    ];
                    //Mail To
                    Mail::to($customer->email)
                        ->send(new Reminder($data,Auth::user()->id));
                    //Delay
                })->delay(now()->addDays($this->reminder));

                session()->flash('success', 'Added Successfully');
                return redirect(route('UserDeadlines'));
            } else {
                session()->flash('error', 'Your subscription allows you to create only ' . $this->allowed_deadlines . ' Deadlines for each Customer.Please check your Subscription');
                return redirect(route('UserDeadlines'));
            }
        } catch (Exception $e) {
            return session()->flash('error', $e->getMessage());
        }
    }
}
