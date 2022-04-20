<?php

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Models\Settings\Property\PropertyAmenities;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('property_amenities', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('description')->nullable();
            $table->string('slug')->unique()->nullable();
            $table->timestamps();
        });

        PropertyAmenities::create([
            'name' => 'AC',
            'description' => 'AC',
            'slug' => Str::random(10),
        ]);

        PropertyAmenities::create([
            'name' => 'Balcony/Deck',
            'description' => 'Balcony/Deck',
            'slug' => Str::random(10),
        ]);

        PropertyAmenities::create([
            'name' => 'Furnished',
            'description' => 'Furnished',
            'slug' => Str::random(10),
        ]);

        PropertyAmenities::create([
            'name' => 'Hardwood Floor',
            'description' => 'Hardwood Floor',
            'slug' => Str::random(10),
        ]);

        PropertyAmenities::create([
            'name' => 'Parking',
            'description' => 'Parking',
            'slug' => Str::random(10),
        ]);

        PropertyAmenities::create([
            'name' => 'Pets Allowed',
            'description' => 'Pets Allowed',
            'slug' => Str::random(10),
        ]);

        PropertyAmenities::create([
            'name' => 'Pool',
            'description' => 'Pool',
            'slug' => Str::random(10),
        ]);

        PropertyAmenities::create([
            'name' => 'Wheelchair Access',
            'description' => 'Wheelchair Access',
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
        Schema::dropIfExists('property_amenities');
    }
};
