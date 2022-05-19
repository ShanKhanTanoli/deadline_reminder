<?php

namespace App\Http\Livewire\Admin\Dashboard\Plans\Edit;

use Exception;
use Livewire\Component;
use App\Helpers\Admin\Admin;

class Index extends Component
{
    public $product, $name, $description;

    public function mount($product)
    {
        if ($find = Admin::FindProduct($product)) {
            $this->product = $find->id;
            $this->name = $find->name;
            $this->description = $find->description;
        } else {
            session()->flash('error', 'Something went wrong');
            return redirect(route('AdminPlans'));
        }
    }

    public function render()
    {
        return view('livewire.admin.dashboard.plans.edit.index')
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Update()
    {
        $validated = $this->validate([
            'name' => 'required|string',
            'description' => 'required|string',
        ]);
        try {
            Admin::UpdateProduct($this->product, $validated['name'], $validated['description']);
            session()->flash('success', 'Updated Successfully');
            return redirect(route('AdminEditPlan', ['product' => $this->product]));
        } catch (Exception $e) {
            session()->flash('error', $e->getMessage());
            return redirect(route('AdminEditPlan', ['product' => $this->product]));
        }
    }
}
