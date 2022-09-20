<?php

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
        Schema::create('deadline_chronologies', function (Blueprint $table) {
            $table->id();

            //Deadline ID Foreign Key
            $table->unsignedBigInteger('deadline_id')
                ->nullable();
            $table->foreign('deadline_id')
                ->references('id')
                ->on('deadlines')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            //User ID Foreign Key
            $table->unsignedBigInteger('user_id')
                ->nullable();
            $table->foreign('user_id')
                ->references('id')
                ->on('users')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            //Customer ID Foreign Key
            $table->unsignedBigInteger('customer_id')
                ->nullable();
            $table->foreign('customer_id')
                ->references('id')
                ->on('customers')
                ->onUpdate('cascade')
                ->onDelete('cascade');

            $table->string('name')->nullable();
            $table->date('date')->nullable();
            $table->double('amount')->nullable();

            $table->enum('renew_state', ['to_renew', 'waiting_cash', 'renewed', 'deleted'])
                ->nullable();

            $table->enum('type_of_renew', ['domain', 'hosting', 'hosting_email', 'wpml', 'privacy_cookie', 'other'])
                ->nullable();

            $table->mediumText('note')->nullable();

            $table->mediumText('private_note')->nullable();

            $table->enum('reminder', ['30_days_before', '60_days_before'])
                ->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('deadline_chronologies');
    }
};
