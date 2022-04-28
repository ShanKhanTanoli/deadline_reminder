<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeadlineChronology extends Model
{
    use HasFactory;

    protected $fillable = [
        'deadline_id',
        'customer_id',
        'user_id',
        'name',
        'date',
        'amount',
        'renew_state',
        'type_of_renew',
        'note',
        'reminder',
    ];
}
