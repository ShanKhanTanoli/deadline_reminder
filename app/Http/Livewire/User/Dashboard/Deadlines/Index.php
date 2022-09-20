<?php

namespace App\Http\Livewire\User\Dashboard\Deadlines;

use Livewire\Component;
use App\Models\Deadline;
use App\Helpers\User\User;
use Livewire\WithPagination;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    use WithPagination;

    public $delete,$renewal_state,$renewal_type,$search,$quantity = 3;

    protected $paginationTheme = 'bootstrap';


    public function render()
    {
        $deadlines = Deadline::where('user_id',Auth::user()->id);

        if($this->renewal_state){
            $deadlines = $deadlines->where('renew_state',$this->renewal_state);
        }

        if($this->renewal_type){
            $deadlines = $deadlines->where('type_of_renew',$this->renewal_type);
        }

        if($this->search){
            $deadlines = $deadlines->where('name','LIKE','%'.$this->search.'%')
            ->orWhere('date','LIKE','%'.$this->search.'%')
            ->orWhere('amount','LIKE','%'.$this->search.'%')
            ->orWhere('note','LIKE','%'.$this->search.'%');
        }

        $deadlines = $deadlines->take($this->quantity)->latest()->get();
        return view('livewire.user.dashboard.deadlines.index')
            ->with(['deadlines' => $deadlines])
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function loadMore()
    {
        $this->quantity+= 3;
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
