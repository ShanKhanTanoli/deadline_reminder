<?php

namespace App\Http\Livewire\User\Dashboard\PlatformPlans;

use Livewire\Component;
use App\Helpers\Admin\Admin;

class Index extends Component
{
    public function render()
    {
        $prices = Admin::Prices(10);
        return view('livewire.user.dashboard.platform-plans.index')
            ->with(['prices' => $prices])
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Subscribe($price)
    {
        return redirect(route('UserSubscribe', ['price' => $price]));
    }
}
