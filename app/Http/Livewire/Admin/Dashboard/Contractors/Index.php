<?php

namespace App\Http\Livewire\Admin\Dashboard\Contractors;

use App\Models\User;
use Livewire\Component;
use Livewire\WithPagination;
use App\Helpers\Contractor\Contractor;

class Index extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';

    public function render()
    {
        $contractors = Contractor::all()->latest()->paginate(6);
        return view('livewire.admin.dashboard.contractors.index')
            ->with(['contractors' => $contractors])
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Edit($id)
    {
        if ($contractor = User::find($id)) {
            return redirect(route('AdminEditContractor', $contractor->slug));
        } else return session()->flash('error', 'Something went wrong');
    }

    public function Delete($id)
    {
        if ($contractor = User::find($id)) {
            $contractor->delete();
            session()->flash('success', 'Deleted Successfully');
            return redirect(route('AdminContractors'));
        } else return session()->flash('error', 'Something went wrong');
    }
}
