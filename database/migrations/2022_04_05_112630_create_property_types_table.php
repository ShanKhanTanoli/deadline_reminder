<?php

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Models\Settings\Property\PropertyType;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('property_types', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('description')->nullable();
            $table->string('slug')->unique()->nullable();
            $table->timestamps();
        });

        PropertyType::create([
            'name' => 'Apartment',
            'description' => 'Apartment',
            'slug' => Str::random(10),
        ]);

        PropertyType::create([
            'name' => 'Commercial',
            'description' => 'Commercial',
            'slug' => Str::random(10),
        ]);

        PropertyType::create([
            'name' => 'Duplex',
            'description' => 'Duplex',
            'slug' => Str::random(10),
        ]);

        PropertyType::create([
            'name' => 'House',
            'description' => 'House',
            'slug' => Str::random(10),
        ]);

        PropertyType::create([
            'name' => 'Other',
            'description' => 'Other',
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
        Schema::dropIfExists('property_types');
    }
};
