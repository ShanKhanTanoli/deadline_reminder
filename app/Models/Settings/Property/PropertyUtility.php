<?php

namespace App\Models\Settings\Property;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PropertyUtility extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'description', 'slug',
    ];
}
