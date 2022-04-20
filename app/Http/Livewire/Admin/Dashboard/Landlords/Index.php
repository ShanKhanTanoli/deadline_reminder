<?php

namespace App\Http\Livewire\Admin\Dashboard\Landlords;

use App\Models\User;
use Livewire\Component;
use Livewire\WithPagination;
use App\Helpers\Landlord\Landlord;

class Index extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';

    public function render()
    {
        $landlords = Landlord::all()->latest()->paginate(6);
        return view('livewire.admin.dashboard.landlords.index')
            ->with(['landlords' => $landlords])
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Edit($id)
    {
        if ($landlord = User::find($id)) {
            return redirect(route('AdminEditLandlord', $landlord->slug));
        } else return session()->flash('error', 'Something went wrong');
    }

    public function Delete($id)
    {
        if ($Landlord = User::find($id)) {
            $Landlord->delete();
            session()->flash('success', 'Deleted Successfully');
            return redirect(route('AdminLandlords'));
        } else return session()->flash('error', 'Something went wrong');
    }
}
