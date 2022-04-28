<?php

namespace App\Http\Livewire\User\Dashboard\Deadlines;

use Livewire\Component;
use App\Helpers\User\User;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';

    public function render()
    {
        $deadlines = User::LatestDeadlinesPaginate(Auth::user()->id, 6);
        return view('livewire.user.dashboard.deadlines.index')
            ->with(['deadlines' => $deadlines])
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Edit($id)
    {
        if ($deadline = User::FindDeadline(Auth::user()->id, $id)) {
            return redirect(route('UserEditDeadline', $deadline->slug));
        } else return session()->flash('error', 'No such deadline found');
    }


    public function ViewCustomer($id)
    {
        if ($customer = User::FindCustomer(Auth::user()->id, $id)) {
            return redirect(route('UserEditCustomer', $customer->slug));
        } else return session()->flash('error', 'No such customer found');
    }

    public function ViewChronologies($id)
    {
        if ($deadline = User::FindDeadline(Auth::user()->id, $id)) {
            return redirect(route('UserDeadlineChronology', $deadline->slug));
        } else return session()->flash('error', 'No such deadline found');
    }

    public function Delete($id)
    {
        if ($deadline = User::FindDeadline(Auth::user()->id, $id)) {
            $deadline->delete();
            return session()->flash('success', 'Deleted Successfully');
        } else return session()->flash('error', 'No such deadline found');
    }
}
