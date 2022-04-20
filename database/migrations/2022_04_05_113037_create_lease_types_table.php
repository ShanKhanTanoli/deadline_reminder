<?php

use Illuminate\Support\Facades\Schema;
use App\Models\Settings\Lease\LeaseType;
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
        Schema::create('lease_types', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('description')->nullable();
            $table->string('slug')->unique()->nullable();
            $table->timestamps();
        });

        LeaseType::create([
            'name' => 'Residential',
            'description' => 'Residential',
            'slug' => Str::random(10),
        ]);

        LeaseType::create([
            'name' => 'Commercial',
            'description' => 'Commercial',
            'slug' => Str::random(10),
        ]);
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('lease_types');
    }
};
