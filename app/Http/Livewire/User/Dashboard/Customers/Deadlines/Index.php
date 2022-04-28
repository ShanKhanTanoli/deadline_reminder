<?php

namespace App\Http\Livewire\User\Dashboard\Customers\Deadlines;

use Livewire\Component;
use App\Helpers\User\User;
use Livewire\WithPagination;
use App\Helpers\Customer\Customer;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';

    public $customer;

    public function mount($slug)
    {
        //Begin::If this User owns a Customer
        if ($customer = User::FindCustomerBySlug(Auth::user()->id, $slug)) {
            $this->customer = $customer;
        } else {
            session()->flash('error', 'No such customer found');
            return redirect(route('UserCustomers'));
        }
        //End::If this User has a Customer
    }

    public function render()
    {
        $deadlines = Customer::LatestDeadlinesPaginate($this->customer->id, 6);
        return view('livewire.user.dashboard.customers.deadlines.index')
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

    public function Delete($id)
    {
        if ($deadline = User::FindDeadline(Auth::user()->id, $id)) {
            $deadline->delete();
            session()->flash('success', 'Deleted Successfully');
            return redirect(route('UserViewCustomerDeadlines', $this->customer->slug));
        } else return session()->flash('error', 'No such deadline found');
    }
}
