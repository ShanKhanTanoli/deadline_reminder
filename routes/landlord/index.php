<?php

use Illuminate\Support\Facades\Route;

use App\Http\Livewire\Landlord\Dashboard\Index as LandlordDashboard;
use App\Http\Livewire\Landlord\Dashboard\Settings\Index as Settings;
use App\Http\Livewire\Landlord\Dashboard\Profile\Index as EditProfile;
use App\Http\Livewire\Landlord\Dashboard\Password\Index as EditPassword;

use App\Http\Livewire\Landlord\Dashboard\Tenants\Index as Tenants;
use App\Http\Livewire\Landlord\Dashboard\Tenants\Add\Index as AddTenant;
use App\Http\Livewire\Landlord\Dashboard\Tenants\Edit\Index as EditTenant;

/*Begin::Auth,Landlord Group*/

Route::middleware(['auth', 'landlord'])->prefix('Landlord')->group(function () {

    Route::get('Dashboard', LandlordDashboard::class)->name('LandlordDashboard');

    /*Begin::Edit Profile & Password Operations*/
    Route::get('EditProfile', EditProfile::class)->name('LandlordEditProfile');
    Route::get('EditPassword', EditPassword::class)->name('LandlordEditPassword');
    /*End::Edit Profile & Password Operations*/

    /*Begin::Tenant Operations*/
    Route::get('Tenants', Tenants::class)->name('LandlordTenants');
    Route::get('AddTenant', AddTenant::class)->name('LandlordAddTenant');
    Route::get('EditTenant/{slug}', EditTenant::class)->name('LandlordEditTenant');
    /*End::Tenant Operations*/

    /*Begin::Settings Operations*/
    Route::get('Settings', Settings::class)->name('LandlordSettings');
    /*End::Settings Operations*/
});
/*End::Auth,Landlord Group*/
