<?php

namespace App\Http\Livewire\User\Dashboard\Deadlines\Edit;

use Exception;
use Livewire\Component;
use App\Helpers\User\User;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    public $deadline, $customer_id, $name, $date, $amount, $renew_state, $type_of_renew, $note, $reminder;

    public function mount($slug)
    {
        //Begin::If this User owns a Deadline
        if ($deadline = User::FindDeadlineBySlug(Auth::user()->id, $slug)) {
            $this->deadline = $deadline;
            $this->customer_id = $deadline->customer_id;
            $this->name = $deadline->name;
            $this->date = $deadline->date;
            $this->amount = $deadline->amount;
            $this->renew_state = $deadline->renew_state;
            $this->type_of_renew = $deadline->type_of_renew;
            $this->note = $deadline->note;
            $this->reminder = $deadline->reminder;
        } else {
            session()->flash('error', 'No such deadline found');
            return redirect(route('UserDeadlines'));
        }
        //End::If this User has a Deadline
    }

    public function render()
    {
        return view('livewire.user.dashboard.deadlines.edit.index')
            ->extends('layouts.dashboard');
    }

    public function Update()
    {
        //Begin::If this User has this Deadline
        if (User::FindDeadline(Auth::user()->id, $this->deadline->id)) {
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
                $this->deadline->update($validated);
                session()->flash('success', 'Updated Successfully');
                return redirect(route('UserEditDeadline', $this->deadline->slug));
            } catch (Exception $e) {
                return session()->flash('error', $e->getMessage());
            }
        } else {
            session()->flash('error', 'No such deadline found');
            return redirect(route('UserDeadlines'));
        }
    }
}
