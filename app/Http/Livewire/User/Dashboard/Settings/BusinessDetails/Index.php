<?php

namespace App\Http\Livewire\User\Dashboard\Settings\BusinessDetails;

use App\Models\Setting;
use Livewire\Component;
use App\Helpers\User\User;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    public $business_name, $business_email, $business_phone, $business_address;

    public function mount()
    {
        if ($details = User::BusinessDetails(Auth::user()->id)) {
            $this->business_name = $details->business_name;
            $this->business_email = $details->business_email;
            $this->business_phone = $details->business_phone;
            $this->business_address = $details->business_address;
        } else {
            $this->business_name = "Home";
            $this->business_email = "Company Email";
            $this->business_phone = "00000000000";
            $this->business_address = "Company Address";
        }
    }

    public function render()
    {
        return view('livewire.user.dashboard.settings.business-details.index')
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Update()
    {
        $msg = [
            'business_name.required' => 'Enter Company Name',
        ];

        $validated = $this->validate([
            'business_name' => 'required|string',
            'business_email' => 'required|email',
            'business_phone' => 'required|numeric',
            'business_address' => 'required|string',
        ], $msg);

        if ($details = User::BusinessDetails(Auth::user()->id)) {
            $details->update($validated);
            session()->flash('success', 'Updated Successfully');
            return redirect(route('UserEditBusinessDetails'));
        } else {
            Setting::create(array_merge($validated, ['user_id' => Auth::user()->id]));
            return session()->flash('success', 'Updated Successfully');
        }
    }
}
