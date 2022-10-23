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
use App\Models\Setting;

//Auth::routes();


Route::get('email', function () {


    $data = [

        'customer_name' => 'customer_name',
        'type_of_renew' => 'type_of_renew',
        'renew_state' => 'renew_state',
        'payment_date' => date('Y-m-d'),
        'payment_amount' => 'payment_amount'

    ];

    return view('emails.reminder-email')
    ->with([
        'data' => $data,
        'id' => 2
    ]);

})->name('viewemail');



Route::get('debug', function () {

    $two_seconds = 1656536976;

    dispatch(function () {

        $customer = Customer::find(1);

        $data = [
            'customer_name' => 'Shan Khan',
            'type_of_renew' => 'Hosting',
            'renew_state' => 'Renewed',
            'payment_date' => date('Y-m-d'),
            'payment_amount' => '10 EURO'
        ];

        Mail::to($customer->email)
        ->send(new Reminder($data,2));

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
