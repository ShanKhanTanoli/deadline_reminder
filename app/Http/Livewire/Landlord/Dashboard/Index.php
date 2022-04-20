<?php

namespace App\Http\Livewire\Landlord\Dashboard;

use Livewire\Component;

class Index extends Component
{
    public function render()
    {
        return view('livewire.landlord.dashboard.index')
            ->extends('layouts.dashboard')
            ->section('content');
    }
}
