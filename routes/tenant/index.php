<?php

use Illuminate\Support\Facades\Route;
use App\Http\Livewire\Tenant\Dashboard\Index as TenantDashboard;
use App\Http\Livewire\Tenant\Dashboard\Profile\Index as EditProfile;
use App\Http\Livewire\Tenant\Dashboard\Password\Index as EditPassword;

/*Begin::Auth,Tenant Group*/

Route::middleware(['auth', 'tenant'])->prefix('Tenant')->group(function () {

    Route::get('Dashboard', TenantDashboard::class)->name('TenantDashboard');

    /*Begin::Edit Profile & Password Operations*/
    Route::get('EditProfile', EditProfile::class)->name('TenantEditProfile');
    Route::get('EditPassword', EditPassword::class)->name('TenantEditPassword');
    /*End::Edit Profile & Password Operations*/
});
/*End::Auth,Tenant Group*/
