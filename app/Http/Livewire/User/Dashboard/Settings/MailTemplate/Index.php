<?php

namespace App\Http\Livewire\User\Dashboard\Settings\MailTemplate;

use Livewire\Component;

class Index extends Component
{
    public $mail_template;

    public function render()
    {
        return view('livewire.user.dashboard.settings.mail-template.index')
            ->extends('layouts.dashboard')
            ->section('content');
    }

    public function Update()
    {
        $validated = $this->validate([
            'mail_template' => 'required|string',
        ]);

        dd($validated);
    }
}
