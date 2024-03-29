<?php

use App\Models\UserBusinessDetail;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_business_details', function (Blueprint $table) {
            $table->id();

            //Users
            $table->unsignedBigInteger('user_id')->nullable();
            $table->foreign('user_id')->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->string('business_name')->nullable();
            $table->string('business_logo')->nullable();
            $table->string('business_email')->nullable();
            $table->string('business_phone')->nullable();
            $table->string('vat_id')->nullable();
            $table->string('business_address')->nullable();

            //Currencies
            $table->unsignedBigInteger('currency_id')->nullable();
            $table->foreign('currency_id')->references('id')
                ->on('currencies')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->timestamps();
        });

        for ($user = 1; $user < 100; $user++) {
            UserBusinessDetail::create([
                'user_id' => $user,
                'business_name' => 'Deadline Reminder',
                'business_email' => 'business@email.com',
                'business_phone' => '+00000000000',
                'vat_id' => mt_rand(10,1000),
                'business_address' => 'This is the Address',
                'currency_id' => 1
            ]);
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_business_details');
    }
};
