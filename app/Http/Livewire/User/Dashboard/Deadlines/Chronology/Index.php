<?php

namespace App\Http\Livewire\User\Dashboard\Deadlines\Chronology;

use App\Helpers\Deadline\Deadline;
use Livewire\Component;
use App\Helpers\User\User;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    public $deadline,$delete;

    public function mount($slug)
    {
        //Begin::If this User has a Deadline
        if ($deadline = User::FindDeadlineBySlug(Auth::user()->id, $slug)) {
            $this->deadline = $deadline;
        } else {
            session()->flash('error', 'No such deadline found');
            return redirect(route('UserDeadlines'));
        }
        //End::If this User has a Deadline
    }
    public function render()
    {
        $chronologies = Deadline::LatestChronologiesPaginate($this->deadline->id, 6);
        return view('livewire.user.dashboard.deadlines.chronology.index')
            ->with(['chronologies' => $chronologies])
            ->extends('layouts.dashboard');
    }

    public function ViewCustomer($id)
    {
        if ($customer = User::FindCustomer(Auth::user()->id, $id)) {
            return redirect(route('UserEditCustomer', $customer->slug));
        } else return session()->flash('error', 'No such customer found');
    }

    public function deleteconfirm($id)
    {
        if ($chronology = Deadline::FindChronology($this->deadline->id, $id)) {
            $this->delete = $chronology;
            $this->emit(['delete']);
        } else return session()->flash('error', 'No such deadline found');
    }

    public function Delete($id)
    {
        if ($chronology = Deadline::FindChronology($this->deadline->id, $id)) {
            $chronology->delete();
            session()->flash('success', 'Deleted Successfully');
            return redirect(route('UserDeadlineChronology', $this->deadline->slug));
        } else return session()->flash('error', 'No such deadline found');
    }
}
