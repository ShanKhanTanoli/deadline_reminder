<?php

namespace App\Models\Settings\Tenant;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TenantType extends Model
{
    use HasFactory;

    protected $fillable = [
        'name', 'description', 'slug',
    ];
}
