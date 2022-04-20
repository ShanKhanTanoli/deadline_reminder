<?php

namespace App\Models\Settings\Lease;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LeaseType extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'description', 'slug',
    ];
}
