<?php

use Illuminate\Support\Facades\Route;
/*Begin::Admin*/
use App\Http\Livewire\Admin\Dashboard\Index as AdminDashboard;
use App\Http\Livewire\Admin\Dashboard\Settings\Index as Settings;
use App\Http\Livewire\Admin\Dashboard\Profile\Index as EditProfile;
use App\Http\Livewire\Admin\Dashboard\Password\Index as EditPassword;
/*End::Admin*/

/*Begin::Landlords*/
use App\Http\Livewire\Admin\Dashboard\Landlords\Index as ViewAllLandlords;
use App\Http\Livewire\Admin\Dashboard\Landlords\Add\Index as AddLandlord;
use App\Http\Livewire\Admin\Dashboard\Landlords\Edit\Index as EditLandlord;
use App\Http\Livewire\Admin\Dashboard\Landlords\UpdatePassword\Index as UpdateLandlordPassword;
/*End::Landlords*/

/*Begin::Tenants*/
use App\Http\Livewire\Admin\Dashboard\Tenants\Index as ViewAllTenants;
use App\Http\Livewire\Admin\Dashboard\Tenants\Add\Index as AddTenant;
use App\Http\Livewire\Admin\Dashboard\Tenants\Edit\Index as EditTenant;
use App\Http\Livewire\Admin\Dashboard\Tenants\UpdatePassword\Index as UpdateTenantPassword;
/*End::Tenants*/

/*Begin::Contractors*/
use App\Http\Livewire\Admin\Dashboard\Contractors\Index as ViewAllContractors;
use App\Http\Livewire\Admin\Dashboard\Contractors\Add\Index as AddContractor;
use App\Http\Livewire\Admin\Dashboard\Contractors\Edit\Index as EditContractor;
use App\Http\Livewire\Admin\Dashboard\Contractors\UpdatePassword\Index as UpdateContractorPassword;
/*End::Contractors*/

/*Begin::Auth,Admin Group*/
Route::middleware(['auth', 'admin'])->prefix('Admin')->group(function () {

    Route::get('Dashboard', AdminDashboard::class)->name('AdminDashboard');

    /*Begin::Landlords*/
    Route::get('Landlords', ViewAllLandlords::class)->name('AdminLandlords');
    Route::get('AddLandlord', AddLandlord::class)->name('AdminAddLandlord');
    Route::get('EditLandlord/{slug}', EditLandlord::class)->name('AdminEditLandlord');
    Route::get('UpdateLandlords/{slug}/Password', UpdateLandlordPassword::class)
        ->name('AdminUpdateLandlordPassword');
    /*End::Landlords*/

    /*Begin::Tenants*/
    Route::get('Tenants', ViewAllTenants::class)->name('AdminTenants');
    Route::get('AddTenant', AddTenant::class)->name('AdminAddTenant');
    Route::get('EditTenant/{slug}', EditTenant::class)->name('AdminEditTenant');
    Route::get('UpdateTenant/{slug}/Password', UpdateTenantPassword::class)
        ->name('AdminUpdateTenantPassword');
    /*End::Tenants*/

    /*Begin::Contractors*/
    Route::get('Contractors', ViewAllContractors::class)->name('AdminContractors');
    Route::get('AddContractor', AddContractor::class)->name('AdminAddContractor');
    Route::get('EditContractor/{slug}', EditContractor::class)->name('AdminEditContractor');
    Route::get('UpdateContractor/{slug}/Password', UpdateContractorPassword::class)
        ->name('AdminUpdateContractorPassword');
    /*End::Contractors*/

    /*Begin::Edit Profile & Password*/
    Route::get('EditProfile', EditProfile::class)->name('AdminEditProfile');
    Route::get('EditPassword', EditPassword::class)->name('AdminEditPassword');
    /*End::Edit Profile & Password*/

    /*Begin::Settings*/
    Route::get('Settings', Settings::class)->name('AdminSettings');
    /*End::Settings*/
});
/*End::Auth,Admin Group*/
