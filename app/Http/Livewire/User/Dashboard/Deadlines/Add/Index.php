<?php

namespace App\Http\Livewire\User\Dashboard\Deadlines\Add;

use Exception;
use Livewire\Component;
use App\Models\Customer;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    public $name, $email, $address, $note;

    public function render()
    {
        return view('livewire.user.dashboard.deadlines.add.index')
            ->extends('layouts.dashboard');
    }

    public function Add()
    {
        $validated = $this->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:customers,email',
            'address' => 'required|string',
            'note' => 'required|string',
        ]);
        try {
            $data = [
                'user_id' => Auth::user()->id,
                'name' => $validated['name'],
                'email' => $validated['email'],
                'address' => $validated['address'],
                'note' => $validated['note'],
                'role_id' => 2,
                'role' => 'user',
                'slug' => strtoupper(Str::random(20)),
            ];
            Customer::create($data);
            session()->flash('success', 'Added Successfully');
            return redirect(route('UserDeadlines'));
        } catch (Exception $e) {
            return session()->flash('error', $e->getMessage());
        }
    }
}
