<?php

namespace App\Http\Livewire\User\Dashboard\Customers\Edit;

use Exception;
use Livewire\Component;
use App\Helpers\User\User;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    public $customer, $name, $email, $address, $note;

    public function mount($slug)
    {
        //Begin::If this User owns a Customer
        if ($customer = User::FindCustomerBySlug(Auth::user()->id, $slug)) {
            $this->customer = $customer;
            $this->name = $customer->name;
            $this->email = $customer->email;
            $this->address = $customer->address;
            $this->note = $customer->note;
        } else {
            session()->flash('error', 'No such customer found');
            return redirect(route('UserCustomers'));
        }
        //End::If this User has a Customer
    }

    public function render()
    {
        return view('livewire.user.dashboard.customers.edit.index')
            ->extends('layouts.dashboard');
    }

    public function Update()
    {
        //Begin::If this User has this Customer
        if (User::FindCustomer(Auth::user()->id, $this->customer->id)) {
            $validated = $this->validate([
                'name' => 'required|string',
                'email' => 'required|email|unique:users,email,' . $this->customer->id,
                'address' => 'required|string',
                'note' => 'required|string',
            ]);
            try {
                $this->customer->update($validated);
                session()->flash('success', 'Updated Successfully');
                return redirect(route('UserEditCustomer', $this->customer->slug));
            } catch (Exception $e) {
                return session()->flash('error', $e->getMessage());
            }
        } else {
            session()->flash('error', 'No such customer found');
            return redirect(route('UserCustomers'));
        }
    }
}
