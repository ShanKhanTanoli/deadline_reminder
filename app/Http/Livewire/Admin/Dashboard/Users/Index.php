<?php

namespace App\Http\Livewire\Admin\Dashboard\Users;

use Livewire\Component;
use App\Helpers\User\User;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    use WithPagination;

    protected $paginationTheme = 'bootstrap';

    public function render()
    {
        $users = User::LatestPaginate(6);
        return view('livewire.admin.dashboard.users.index')
            ->with(['users' => $users])
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Edit($id)
    {
        if ($user = User::Find($id)) {
            return redirect(route('AdminEditUser', $user->slug));
        } else return session()->flash('error', 'Something went wrong');
    }

    public function Delete($id)
    {
        if ($user = User::Find($id)) {
            $user->delete();
            return session()->flash('success', 'Deleted Successfully');
        } else return session()->flash('error', 'Something went wrong');
    }
}
