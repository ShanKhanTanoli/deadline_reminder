<?php

use Illuminate\Support\Facades\Route;
use App\Http\Livewire\Admin\Dashboard\Index as AdminDashboard;


/*Begin::Users*/
use App\Http\Livewire\Admin\Dashboard\Users\Index as ViewAllUsers;
use App\Http\Livewire\Admin\Dashboard\Users\Add\Index as AddUser;
use App\Http\Livewire\Admin\Dashboard\Users\Edit\Index as EditUser;
use App\Http\Livewire\Admin\Dashboard\Users\UpdatePassword\Index as UpdateUserPassword;
/*End::Users*/

/*Begin::Plans*/
use App\Http\Livewire\Admin\Dashboard\Plans\Index as AllPlans;
use App\Http\Livewire\Admin\Dashboard\Plans\Add\Index as AddPlan;
use App\Http\Livewire\Admin\Dashboard\Plans\Edit\Index as EditPlan;
/*End::Plans*/

/*Begin::Settings*/
use App\Http\Livewire\Admin\Dashboard\Settings\Index as Settings;
use App\Http\Livewire\Admin\Dashboard\Settings\Profile\Index as EditProfile;
use App\Http\Livewire\Admin\Dashboard\Settings\Lease\Types\Index as LeaseTypes;
use App\Http\Livewire\Admin\Dashboard\Settings\Tenant\Types\Index as TenantTypes;
use App\Http\Livewire\Admin\Dashboard\Settings\Currencies\Index as Currency;
use App\Http\Livewire\Admin\Dashboard\Settings\Currencies\Edit\Index as EditCurrency;
use App\Http\Livewire\Admin\Dashboard\Settings\Password\Index as EditPassword;
/*End::Settings*/


/*Begin::Auth,Admin Group*/

Route::middleware(['auth', 'admin'])->prefix('Admin')->group(function () {

    Route::get('Dashboard', AdminDashboard::class)->name('AdminDashboard');

    /*Begin::Users*/
    Route::get('Users', ViewAllUsers::class)->name('AdminUsers');
    Route::get('AddUser', AddUser::class)->name('AdminAddUser');
    Route::get('EditUser/{slug}', EditUser::class)->name('AdminEditUser');
    Route::get('UpdateUser/{slug}/Password', UpdateUserPassword::class)
        ->name('AdminUpdateUserPassword');
    /*End::Users*/

    /*Begin::Plans*/
    Route::get('Plans', AllPlans::class)
        ->name('AdminPlans');

    Route::get('AddPlan', AddPlan::class)
        ->name('AdminAddPlan');

    Route::get('EditPlan/{product}', EditPlan::class)
        ->name('AdminEditPlan');
    /*End::Plans*/

    /*Begin::Settings*/
    Route::get('Settings/General', Settings::class)->name('AdminSettings');
    Route::get('Settings/Profile', EditProfile::class)->name('AdminEditProfile');
    Route::get('Settings/LeaseTypes', LeaseTypes::class)->name('AdminLeaseTypes');
    Route::get('Settings/TenantTypes', TenantTypes::class)->name('AdminTenantTypes');
    Route::get('Settings/Currency', Currency::class)->name('AdminCurrency');
    Route::get('Settings/EditCurrency/{slug}', EditCurrency::class)
        ->name('AdminEditCurrency');
    Route::get('Settings/Password', EditPassword::class)->name('AdminEditPassword');
    /*End::Settings*/
});
/*End::Auth,Admin Group*/
