<?php

namespace App\Http\Livewire\User\Dashboard\Deadlines;

use Livewire\Component;
use App\Helpers\User\User;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    use WithPagination;

    public $delete,$renewal_state,$renewal_type,$search,$result;

    protected $paginationTheme = 'bootstrap';


    public function render()
    {
        $deadlines = $this->result = Auth::user()->deadlines;

        if($this->renewal_state){
            $deadlines = $this->result->where('renew_state',$this->renewal_state);
            $this->reset(['renewal_type']);
        }

        if($this->renewal_type){
            $deadlines = $this->result->where('type_of_renew',$this->renewal_type);
            $this->reset(['renewal_state']);
        }

        if($this->search){
            dd($this->search);
        }

        $deadlines = $deadlines->take(6);
        return view('livewire.user.dashboard.deadlines.index')
            ->with(['deadlines' => $deadlines])
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Edit($id)
    {
        if ($deadline = User::FindDeadline(Auth::user()->id, $id)) {
            return redirect(route('UserEditDeadline', $deadline->slug));
        } else return session()->flash('error', 'No such deadline found');
    }


    public function ViewCustomer($id)
    {
        if ($customer = User::FindCustomer(Auth::user()->id, $id)) {
            return redirect(route('UserEditCustomer', $customer->slug));
        } else return session()->flash('error', 'No such customer found');
    }

    public function ViewChronologies($id)
    {
        if ($deadline = User::FindDeadline(Auth::user()->id, $id)) {
            return redirect(route('UserDeadlineChronology', $deadline->slug));
        } else return session()->flash('error', 'No such deadline found');
    }

    public function deleteconfirm($id)
    {
        if ($deadline = User::FindDeadline(Auth::user()->id, $id)) {
            $this->delete = $deadline;
            $this->emit(['delete']);
        } else return session()->flash('error', 'No such deadline found');
    }

    public function Delete($id)
    {
        if ($deadline = User::FindDeadline(Auth::user()->id, $id)) {
            $deadline->delete();
            session()->flash('success', 'Deleted Successfully');
            return redirect(route('UserDeadlines'));
        } else return session()->flash('error', 'No such deadline found');
    }
}
