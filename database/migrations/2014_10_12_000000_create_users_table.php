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

            $table->string('role')->nullable();
            $table->string('role_id')->nullable();

            $table->string('slug')->nullable();

            $table->string('parent_business_id')->nullable();

            $table->rememberToken()->nullable();
            $table->timestamps();
        });

        User::create([
            'name' => 'admin',
            'user_name' => 'admin',
            'email' => 'admin@admin.com',
            'number' => mt_rand(100000000000, 999999999999),
            'password' => bcrypt('password'),
            'role' => 'admin',
            'role_id' => '1',
            'slug' => strtoupper(Str::random(20)),
        ]);

        for ($user = 1; $user < 101; $user++) {
            User::create([
                'name' => 'user' . $user,
                'user_name' => 'user' . $user,
                'email' => 'user' . $user . '@user.com',
                'number' => mt_rand(100000000000, 999999999999),
                'password' => bcrypt('password'),
                'role' => 'user',
                'role_id' => '2',
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
