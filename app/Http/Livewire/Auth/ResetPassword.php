<?php

namespace App\Http\Livewire\Auth;

use App\Models\User;
use Livewire\Component;
use Illuminate\Support\Facades\Hash;

class ResetPassword extends Component
{
    public $email, $password, $passwordConfirmation;

    public $urlID = '';

    protected $rules = [
        'email' => 'required|email',
        'password' => 'required|min:6|same:passwordConfirmation'
    ];

    public function mount($id)
    {
        if ($existingUser = User::find($id)) {
            $this->email = $existingUser->email;
            $this->urlID = intval($existingUser->id);
        } else {
            return session()->flash('error', 'Something went wrong');
        }
    }

    public function resetPassword()
    {
        $this->validate();
        $existingUser = User::where('email', $this->email)->first();
        if ($existingUser && $existingUser->id == $this->urlID) {
            $existingUser->update([
                'password' => Hash::make($this->password)
            ]);
            redirect('login');
            session()->flash('success', 'Password changed successfully');
        } else {
            return session()->flash('error', 'Something went wrong');
        }
    }

    public function render()
    {
        return view('livewire.auth.passwords.reset')
            ->extends('layouts.auth')
            ->section('content');
    }
}
