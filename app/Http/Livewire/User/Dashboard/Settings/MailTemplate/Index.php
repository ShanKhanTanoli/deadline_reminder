<?php

namespace App\Http\Livewire\User\Dashboard\Settings\MailTemplate;

use App\Models\Setting;
use Livewire\Component;
use App\Helpers\User\User;
use Illuminate\Support\Facades\Auth;

class Index extends Component
{
    public $email_template;

    public function mount()
    {
        if ($details = User::BusinessDetails(Auth::user()->id)) {
            $this->email_template = $details->email_template;
        } else {
            $this->email_template = "Write something for email template";
        }
    }

    public function render()
    {
        return view('livewire.user.dashboard.settings.mail-template.index')
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Update()
    {
        $validated = $this->validate([
            'email_template' => 'required|string',
        ]);
        if ($details = User::BusinessDetails(Auth::user()->id)) {
            $details->update($validated);
            session()->flash('success', 'Updated Successfully');
            return redirect(route('UserEditMailTemplate'));
        } else {
            return session()->flash('error', 'Something went wrong');
        }
    }
}
