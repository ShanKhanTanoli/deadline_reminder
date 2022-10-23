<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class Reminder extends Mailable implements ShouldQueue
{
    use Queueable, SerializesModels;

    public $data = [];
    public $id;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($data,$id)
    {
        $this->data = $data;
        $this->id = $id;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->from('support@email.com')
            ->subject(ucfirst($this->data['type_of_renew']) . ' ' . ucfirst($this->data['renew_state']))
            ->view('emails.reminder-email');
    }
}
