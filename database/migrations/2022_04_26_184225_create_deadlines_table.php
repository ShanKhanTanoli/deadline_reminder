<?php

use App\Models\Deadline;
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
        Schema::create('deadlines', function (Blueprint $table) {
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

            //Customer Foreign Key
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

            $table->string('slug')->unique()->nullable();

            $table->timestamps();
        });

        for ($customer = 1; $customer < 10; $customer++) {
            for ($deadline = 1; $deadline < mt_rand(5, 10); $deadline++) {
                Deadline::create([
                    'customer_id' => $customer,
                    'user_id' => 2,
                    'name' => 'Deadline' . $deadline,
                    'date' => date('Y-' . mt_rand(2, 3) . '-' . mt_rand(1, 28)),
                    'amount' => mt_rand(10, 100),
                    'renew_state' => 'to_renew',
                    'type_of_renew' => 'domain',
                    'note' => 'This is a Public Note',
                    'private_note' => 'This is a Private Note',
                    'reminder' => '30_days_before',
                    'slug' => strtoupper(Str::random(20)),
                ]);
            }
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('deadlines');
    }
};
