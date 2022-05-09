<?php

namespace App\Http\Livewire\User\Dashboard\Deadlines\Add;

use Exception;
use Livewire\Component;
use App\Models\Deadline;
use Illuminate\Support\Str;
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
        ],$msg);

        try {
            $data = [
                'user_id' => Auth::user()->id,
                'slug' => strtoupper(Str::random(20)),
            ];
            Deadline::create(array_merge($data,$validated));
            session()->flash('success', 'Added Successfully');
            return redirect(route('UserDeadlines'));
        } catch (Exception $e) {
            return session()->flash('error', $e->getMessage());
        }
    }
}
