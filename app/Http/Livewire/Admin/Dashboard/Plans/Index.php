<?php

namespace App\Http\Livewire\Admin\Dashboard\Plans;

use Livewire\Component;
use App\Helpers\Admin\Admin;

class Index extends Component
{
    public $delete;
    public $load = 3;

    public function render()
    {
        $prices = Admin::ActivePrices($this->load);
        return view('livewire.admin.dashboard.plans.index')
            ->with(['prices' => $prices])
            ->extends('layouts.dashboard')
            ->section('content');
    }


    public function Edit($id)
    {
        if ($price = Admin::FindPrice($id)) {
            return redirect(route('AdminEditPlan', ['product' => $price->product]));
        } else return session()->flash('error', 'Something went wrong');
    }

    public function Archive($id)
    {
        if ($price = Admin::FindPrice($id)) {
            Admin::ArchiveProduct($price->product);
            session()->flash('success', 'Archived Successfully');
            return redirect(route('AdminPlans'));
        } else {
            session()->flash('error', 'Something went wrong');
            return redirect(route('AdminPlans'));
        }
    }

    public function Activate($id)
    {
        if ($price = Admin::FindPrice($id)) {
            Admin::ActivateProduct($price->product);
            session()->flash('success', 'Activated Successfully');
            return redirect(route('AdminPlans'));
        } else {
            session()->flash('error', 'Something went wrong');
            return redirect(route('AdminPlans'));
        }
    }

    public function LoadMore()
    {
        $this->load += 3;
    }
}
