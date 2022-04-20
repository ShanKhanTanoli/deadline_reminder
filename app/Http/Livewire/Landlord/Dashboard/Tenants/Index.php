<?php

namespace App\Http\Livewire\Landlord\Dashboard\Tenants;

use App\Models\User;
use Livewire\Component;
use Livewire\WithPagination;
use App\Helpers\Landlord\Landlord;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';

    public function render()
    {
        $tenants = Landlord::tenants(Auth::user()->id)->latest()->paginate(6);
        return view('livewire.landlord.dashboard.tenants.index')
            ->with(['tenants' => $tenants])
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Edit($id)
    {
        if ($user = User::find($id)) {
            if ($tenant = Landlord::FindTenant(Auth::user()->id, $user->id)) {
                return redirect(route('LandlordEditTenant', $tenant->slug));
            }
            return session()->flash('error', 'No such tenant found');
        }
        return session()->flash('error', 'No such tenant found');
    }

    public function Delete($id)
    {
        if ($user = User::find($id)) {
            if ($tenant = Landlord::FindTenant(Auth::user()->id, $user->id)) {
                $tenant->delete();
                return session()->flash('success', 'Deleted Successfully');
            }
            return session()->flash('error', 'No such tenant found');
        }
        return session()->flash('error', 'No such tenant found');
    }
}
