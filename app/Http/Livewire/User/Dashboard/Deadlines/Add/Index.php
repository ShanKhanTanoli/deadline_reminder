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
        $validated = $this->validate([
            'customer_id' => 'required|numeric',
            'name' => 'required|string',
            'date' => 'required|date',
            'amount' => 'required|numeric',
            'renew_state' => 'required|string|in:to_renew,waiting_cash,renewed,deleted',
            'type_of_renew' => 'required|string|in:domain,hosting,hosting_email,wpml,privacy_cookie,other',
            'note' => 'required|string',
            'reminder' => 'required|string|in:30_days_before,60_days_before',
        ]);
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
