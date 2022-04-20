<?php

use App\Http\Livewire\Auth\Login;
use App\Http\Livewire\Auth\Logout;
use Illuminate\Support\Facades\Route;
use App\Http\Livewire\Auth\VerifyEmail;
use App\Http\Livewire\Auth\ResetPassword;
use App\Http\Livewire\Auth\ForgotPassword;

use App\Http\Livewire\Auth\Register\TenantSignUp;
use App\Http\Livewire\Auth\Register\LandlordSignUp;
use App\Http\Livewire\Auth\Register\ContractorSignUp;

/*Begin::Auth Routes*/

Route::get('register', function () {
    return redirect(route('login'));
})->name('register');

Route::get('LandlordRegister', LandlordSignUp::class)
    ->name('landlord-register');

Route::get('TenantRegister', TenantSignUp::class)
    ->name('tenant-register');

Route::get('ContractorRegister', ContractorSignUp::class)
    ->name('contractor-register');

Route::get('login', Login::class)
    ->name('login');

Route::get('logout', Logout::class)
    ->name('logout');

Route::get('login/forgot-password', ForgotPassword::class)
    ->name('forgot-password');

Route::get('reset-password/{id}', ResetPassword::class)
    ->name('reset-password')->middleware('signed');

Route::get('VerifyEmail', VerifyEmail::class)
    ->name('verification.notice')
    ->middleware('auth');
/*End::Auth Routes*/
