<?php

namespace App\Http\Livewire\Contractor\Dashboard;

use Livewire\Component;

class Index extends Component
{
    public function render()
    {
        return view('livewire.contractor.dashboard.index')
        ->extends('layouts.dashboard')
        ->section('content');
    }
}
