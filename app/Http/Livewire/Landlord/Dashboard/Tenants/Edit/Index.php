<?php

namespace App\Http\Livewire\Landlord\Dashboard\Tenants\Edit;

use Exception;
use App\Models\User;
use Livewire\Component;
use App\Helpers\Landlord\Landlord;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    public $user, $name, $user_name, $number, $email;

    public function mount($slug)
    {
        if ($user = User::where('slug', $slug)->first()) {
            if ($tenant = Landlord::FindTenant(Auth::user()->id, $user->id)) {

                $this->user = $tenant;

                $this->name = $tenant->name;
                $this->user_name = $tenant->user_name;
                $this->number = $tenant->number;
                $this->email = $tenant->email;
            } else {
                session()->flash('error', 'No such tenant found');
                return redirect(route('LandlordTenants'));
            }
        } else {
            session()->flash('error', 'No such tenant found');
            return redirect(route('LandlordTenants'));
        }
    }

    public function render()
    {
        return view('livewire.landlord.dashboard.tenants.edit.index')
            ->extends('layouts.dashboard');
    }

    public function Update()
    {
        $validated = $this->validate([
            'name' => 'required|string|min:3',
            'user_name' => 'required|string|unique:users,user_name,' . $this->user->id,
            'number' => 'required|numeric|unique:users,number,' . $this->user->id,
            'email' => 'required|email|unique:users,email,' . $this->user->id,
        ]);
        try {
            $data = [
                'name' => $validated['name'],
                'user_name' => $validated['user_name'],
                'email' => $validated['email'],
                'number' => $validated['number'],
            ];
            $this->user->update($data);
            session()->flash('success', 'Updated Successfully');
            return redirect(route('LandlordEditTenant', $this->user->slug));
        } catch (Exception $e) {
            return session()->flash('error', $e->getMessage());
        }
    }
}
