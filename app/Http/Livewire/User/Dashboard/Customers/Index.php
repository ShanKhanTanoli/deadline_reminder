<?php

namespace App\Http\Livewire\User\Dashboard\Customers;

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
        $customers = User::LatestCustomersPaginate(Auth::user()->id, 6);
        return view('livewire.user.dashboard.customers.index')
            ->with(['customers' => $customers])
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Edit($id)
    {
        if ($customer = User::FindCustomer(Auth::user()->id, $id)) {
            return redirect(route('UserEditCustomer', $customer->slug));
        } else return session()->flash('error', 'No such customer found');
    }

    public function CustomerDeadlines($id)
    {
        if ($customer = User::FindCustomer(Auth::user()->id, $id)) {
            return redirect(route('UserViewCustomerDeadlines', $customer->slug));
        } else return session()->flash('error', 'No such customer found');
    }

    public function Delete($id)
    {
        if ($customer = User::FindCustomer(Auth::user()->id, $id)) {
            $customer->delete();
            return session()->flash('success', 'Deleted Successfully');
        } else return session()->flash('error', 'No such customer found');
    }
}
