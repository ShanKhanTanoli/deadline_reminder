<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Customer extends Model
{
    use HasFactory;

    protected $fillable = [
        'subscription_id',
        'user_id',
        'name',
        'email',
        'address',
        'note',
        'slug',
    ];
}
