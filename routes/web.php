<?php

use Illuminate\Support\Facades\Route;

//Auth::routes();

Route::get('debug', function () {
    return "done";
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

/*Begin::Landlord Routes*/
include('landlord/index.php');
/*End::Landlord Routes*/

/*Begin::Tenant Routes*/
include('tenant/index.php');
/*End::Tenant Routes*/

/*Begin::Contractor Routes*/
include('contractor/index.php');
/*End::Contractor Routes*/

/*Begin::Auth Routes*/
include('auth/index.php');
/*End::Auth Routes*/
