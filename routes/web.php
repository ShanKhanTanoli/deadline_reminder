<?php

use App\Mail\Reminder;
use App\Models\Customer;
use App\Helpers\Admin\Admin;
use App\Http\Livewire\Auth\Login;
use App\Http\Livewire\Auth\Logout;
use App\Http\Livewire\Auth\SignUp;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Route;
use App\Http\Livewire\Auth\VerifyEmail;
use App\Http\Livewire\Auth\ResetPassword;
use App\Http\Livewire\Auth\ForgotPassword;

//Auth::routes();


Route::get('email', function () {

    $data = [
        'name' => 'shankhan',
        'type_of_renew' => 'Domain',
        'renew_state' => 'Renewed',
    ];
    return view('emails.reminder-email', compact('data'));
});

Route::get('debug', function () {

    $two_seconds = 1656536976;


    dispatch(function () {

        $customer = Customer::find(1);

        $data = [
            'name' => $customer->name,
            'type_of_renew' => 'Hosting',
            'renew_state' => 'Renewed',
            'date' => date('Y-m-d'),
            'amount' => '10 EURO',
            'note' => 'This is a Note',
        ];

        Mail::to($customer->email)
        ->send(new Reminder($data));

    })->delay(now()->addSeconds(2));

    dd('true');
});


Route::get('/home', function () {
    return redirect(route('AdminDashboard'));
})->name('home');


Route::get('/', function () {
    return redirect(route('login'));
})->name('main');

/*Begin::Admin Routes*/
include('admin/index.php');
/*End::Admin Routes*/

/*Begin::User Routes*/
include('user/index.php');
/*End::User Routes*/


/*Begin::Auth Routes*/
Route::get('register', SignUp::class)
    ->name('register');

Route::get('/login', Login::class)
    ->name('login');

Route::get('logout', Logout::class)
    ->name('logout');

Route::get('/login/forgot-password', ForgotPassword::class)
    ->name('forgot-password');

Route::get('/reset-password/{id}', ResetPassword::class)
    ->name('reset-password')->middleware('signed');

Route::get('VerifyEmail', VerifyEmail::class)
    ->name('verification.notice')
    ->middleware('auth');
/*End::Auth Routes*/
