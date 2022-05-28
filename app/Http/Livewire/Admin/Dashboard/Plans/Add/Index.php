<?php

namespace App\Http\Livewire\Admin\Dashboard\Plans\Add;

use Exception;
use Livewire\Component;
use App\Helpers\Admin\Admin;

class Index extends Component
{
    public $validated,
        $name,
        $amount,
        $description,
        $interval_count,
        $interval,
        $customers,
        $deadlines;

    public $add_customers, $add_deadlines, $metadata;

    public function render()
    {
        return view('livewire.admin.dashboard.plans.add.index')
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Add()
    {

        //If only customers exist
        if ($this->customers) {
            $validated = $this->validate([
                'name' => 'required|string',
                'amount' => 'required|numeric',
                'description' => 'required|string',
                'add_customers' => 'required|numeric',
                'interval' => 'required|string|in:day,week,month,year',
                'interval_count' => 'required|numeric',
            ]);
            $this->validated = $validated;
        }

        //If only deadlines exist
        if ($this->deadlines) {
            $validated = $this->validate([
                'name' => 'required|string',
                'amount' => 'required|numeric',
                'description' => 'required|string',
                'add_deadlines' => 'required|numeric',
                'interval' => 'required|string|in:day,week,month,year',
                'interval_count' => 'required|numeric',
            ]);
            $this->validated = $validated;
        }

        //If customers and deadlines both exist
        if ($this->customers && $this->deadlines) {
            $validated = $this->validate([
                'name' => 'required|string',
                'amount' => 'required|numeric',
                'description' => 'required|string',
                'add_customers' => 'required|numeric',
                'add_deadlines' => 'required|numeric',
                'interval' => 'required|string|in:day,week,month,year',
                'interval_count' => 'required|numeric',
            ]);
            $this->validated = $validated;
        }

        //If customers and deadlines both doesnot exist
        if (!$this->customers && !$this->deadlines) {
            $validated = $this->validate([
                'name' => 'required|string',
                'amount' => 'required|numeric',
                'description' => 'required|string',
                'interval' => 'required|string|in:day,week,month,year',
                'interval_count' => 'required|numeric',
            ]);
            $this->validated = $validated;
        }


        try {

            //metadata
            //If only customers exist
            if ($this->customers) {
                $metadata = [
                    'metadata' => [
                        'customers' => $validated['add_customers']
                    ],
                ];
                $this->metadata = $metadata;
            }

            //metadata
            //If only deadlines exist
            if ($this->deadlines) {
                $metadata = [
                    'metadata' => [
                        'deadlines' => $validated['add_deadlines']
                    ],
                ];
                $this->metadata = $metadata;
            }

            //metadata
            //If customers and deadlines both exist
            if ($this->customers && $this->deadlines) {
                $metadata = [
                    'metadata' => [
                        'customers' => $validated['add_customers'],
                        'deadlines' => $validated['add_deadlines'],
                    ],
                ];
                $this->metadata = $metadata;
            }

            //Create Product with recurring pricing 
            $name = $validated['name'];
            $description = $validated['description'];
            $amount = $validated['amount'];
            $interval_count = $validated['interval_count'];
            $interval = $validated['interval'];

            Admin::AddRecurringProductWithPrice($name, $description, $amount, $interval_count, $interval , $this->metadata);
            session()->flash('success', "Added Successfully");
            return redirect(route('AdminPlans'));
        } catch (Exception $e) {
            session()->flash('error', $e->getMessage());
            return redirect(route('AdminAddPlan'));
        }
    }
}
