<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Deadline extends Model
{
    use HasFactory;

    protected $fillable = [
        'subscription_id',
        'customer_id',
        'user_id',
        'name',
        'date',
        'amount',
        'renew_state',
        'type_of_renew',
        'note',
        'private_note',
        'reminder',
        'slug',
    ];
}
