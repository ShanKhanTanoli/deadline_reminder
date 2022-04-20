<?php

use Illuminate\Support\Facades\Route;
use App\Http\Livewire\Contractor\Dashboard\Index as ContractorDashboard;
use App\Http\Livewire\Contractor\Dashboard\Profile\Index as EditProfile;
use App\Http\Livewire\Contractor\Dashboard\Password\Index as EditPassword;

/*Begin::Auth,Contractor Group*/

Route::middleware(['auth', 'contractor'])->prefix('Contractor')->group(function () {

    Route::get('Dashboard', ContractorDashboard::class)->name('ContractorDashboard');

    /*Begin::Edit Profile & Password Operations*/
    Route::get('EditProfile', EditProfile::class)->name('ContractorEditProfile');
    Route::get('EditPassword', EditPassword::class)->name('ContractorEditPassword');
    /*End::Edit Profile & Password Operations*/
});
/*End::Auth,Contractor Group*/
