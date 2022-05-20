<?php

use Illuminate\Support\Facades\Route;

/*Begin::Dashboard*/
use App\Http\Livewire\User\Dashboard\Index as UserDashboard;
/*End::Dashboard*/

/*Begin::Platform Plans*/
use App\Http\Livewire\User\Dashboard\PlatformPlans\Index as PlatformPlans;
/*End::Platform Plans*/

/*Begin::Subscribe*/
use App\Http\Livewire\User\Dashboard\Subscribe\Index as Subscribe;
/*End::Subscribe*/

/*Begin::Customers*/
use App\Http\Livewire\User\Dashboard\Customers\Index as Customers;
use App\Http\Livewire\User\Dashboard\Customers\Add\Index as AddCustomer;
use App\Http\Livewire\User\Dashboard\Customers\Edit\Index as EditCustomer;
use App\Http\Livewire\User\Dashboard\Customers\Deadlines\Index as CustomerDeadlines;
/*End::Customers*/

/*Begin::Deadlines*/
use App\Http\Livewire\User\Dashboard\Deadlines\Index as Deadlines;
use App\Http\Livewire\User\Dashboard\Deadlines\Add\Index as AddDeadline;
use App\Http\Livewire\User\Dashboard\Deadlines\Edit\Index as EditDeadline;
use App\Http\Livewire\User\Dashboard\Deadlines\Chronology\Index as DeadlineChronology;
/*End::Deadlines*/

/*Begin::Subscriptions*/
use App\Http\Livewire\User\Dashboard\Subscriptions\Index as Subscriptions;
/*End::Subscriptions*/

/*Begin::Settings*/
use App\Http\Livewire\User\Dashboard\Settings\BusinessDetails\Index as EditBusinessDetails;
use App\Http\Livewire\User\Dashboard\Settings\Profile\Index as EditProfile;
use App\Http\Livewire\User\Dashboard\Settings\Password\Index as EditPassword;
/*End::Settings*/

/*Begin::Auth,User Group*/

Route::middleware(['auth', 'user'])->prefix('User')->group(function () {

    Route::get('Dashboard', UserDashboard::class)->name('UserDashboard');

    /*Begin::PlatformPlans*/
    Route::get('PlatformPlans', PlatformPlans::class)
        ->name('UserPlatformPlans');
    /*End::PlatformPlans*/

    /*Begin::Subscribe*/
    Route::get('Subscribe/{price}', Subscribe::class)
        ->name('UserSubscribe');
    /*End::Subscribe*/

    /*Begin::Customers*/
    Route::get('Customers', Customers::class)
        ->name('UserCustomers');

    Route::get('AddCustomer', AddCustomer::class)
        ->name('UserAddCustomer');

    Route::get('EditCustomer/{slug}', EditCustomer::class)
        ->name('UserEditCustomer');

    Route::get('Customer/{slug}/Deadlines', CustomerDeadlines::class)
        ->name('UserViewCustomerDeadlines');
    /*End::Customers*/

    /*Begin::Deadlines*/
    Route::get('Deadlines', Deadlines::class)
        ->name('UserDeadlines');

    Route::get('AddDeadline', AddDeadline::class)
        ->name('UserAddDeadline');

    Route::get('EditDeadline/{slug}', EditDeadline::class)
        ->name('UserEditDeadline');

    Route::get('Deadline/{slug}/Chronology', DeadlineChronology::class)
        ->name('UserDeadlineChronology');
    /*End::Deadlines*/

    /*Begin::Subscriptions*/
    Route::get('Subscriptions', Subscriptions::class)
    ->name('UserSubscriptions');
    /*End::Subscriptions*/

    /*Begin::Settings*/
    Route::get('Settings/BusinessDetails', EditBusinessDetails::class)
        ->name('UserEditBusinessDetails');
    Route::get('Settings/Profile', EditProfile::class)->name('UserEditProfile');
    Route::get('Settings/Password', EditPassword::class)->name('UserEditPassword');
    /*End::Settings*/
});
/*End::Auth,User Group*/
