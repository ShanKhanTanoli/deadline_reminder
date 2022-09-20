<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserBusinessDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'business_name',
        'business_logo',
        'business_email',
        'business_phone',
        'vat_id',
        'business_address',
        'currency_id'
    ];
}
