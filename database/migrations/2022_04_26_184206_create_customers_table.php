<?php

use App\Models\Customer;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('customers', function (Blueprint $table) {
            $table->id();

            //Subscription Foreign Key
            $table->unsignedBigInteger('subscription_id')
                ->nullable();
            $table->foreign('subscription_id')
                ->references('id')
                ->on('subscriptions')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            //User Foreign Key
            $table->unsignedBigInteger('user_id')
                ->nullable();
            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->string('name')->nullable();
            $table->string('email')->unique()->nullable();
            $table->string('address')->nullable();
            $table->mediumText('note')->nullable();

            $table->string('slug')->unique()->nullable();

            $table->timestamps();
        });

        // for ($user = 2; $user < 3; $user++) {
        //     for ($customer = 1; $customer < 10; $customer++) {
        //         Customer::create([
        //             'user_id' => $user,
        //             'name' => 'customer' . $customer,
        //             'email' => 'customer' . $customer . '@customer.com',
        //             'address' => 'This is Address',
        //             'note' => 'This is Note',
        //             'slug' => strtoupper(Str::random(20)),
        //         ]);
        //     }
        // }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('customers');
    }
};
