<?php

use App\Models\User;
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
        Schema::create('users', function (Blueprint $table) {
            $table->id();

            $table->string('avatar')->nullable();
            $table->string('name')->nullable();
            $table->string('user_name')->unique()->nullable();
            $table->string('email')->unique()->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('number')->unique()->nullable();
            $table->string('password')->nullable();

            $table->enum('role', ['admin', 'landlord', 'tenant', 'contractor'])->nullable();

            $table->enum('role_id', ['1', '2', '3', '4'])->nullable();

            $table->string('slug')->nullable();

            $table->rememberToken()->nullable();
            $table->timestamps();
        });

        User::create([
            'name' => 'admin',
            'user_name' => 'admin',
            'email' => 'admin@email.com',
            'number' => mt_rand(100000000000, 999999999999),
            'password' => bcrypt('password'),
            'role' => 'admin',
            'role_id' => '1',
            'slug' => strtoupper(Str::random(20)),
        ]);

        for ($landlord = 1; $landlord < 101; $landlord++) {
            User::create([
                'name' => 'landlord' . $landlord,
                'user_name' => 'landlord' . $landlord,
                'email' => 'landlord' . $landlord . '@email.com',
                'number' => mt_rand(100000000000, 999999999999),
                'password' => bcrypt('password'),
                'role' => 'landlord',
                'role_id' => '2',
                'slug' => strtoupper(Str::random(20)),
            ]);
        }

        for ($tenant = 1; $tenant < 101; $tenant++) {
            User::create([
                'name' => 'tenant' . $tenant,
                'user_name' => 'tenant' . $tenant,
                'email' => 'tenant' . $tenant . '@email.com',
                'number' => mt_rand(100000000000, 999999999999),
                'password' => bcrypt('password'),
                'role' => 'tenant',
                'role_id' => '3',
                'slug' => strtoupper(Str::random(20)),
            ]);
        }

        for ($contractor = 1; $contractor < 101; $contractor++) {
            User::create([
                'name' => 'contractor' . $contractor,
                'user_name' => 'contractor' . $contractor,
                'email' => 'contractor' . $contractor . '@email.com',
                'number' => mt_rand(100000000000, 999999999999),
                'password' => bcrypt('password'),
                'role' => 'contractor',
                'role_id' => '4',
                'slug' => strtoupper(Str::random(20)),
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
        Schema::dropIfExists('users');
    }
};
