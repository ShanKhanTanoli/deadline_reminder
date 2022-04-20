<?php

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Models\Settings\Property\PropertyUnitType;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('property_unit_types', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('description')->nullable();
            $table->string('slug')->unique()->nullable();
            $table->timestamps();
        });

        PropertyUnitType::create([
            'name' => 'Two Bed Rooms',
            'description' => 'Two Bed Rooms',
            'slug' => Str::random(10),
        ]);

        PropertyUnitType::create([
            'name' => 'Single Room',
            'description' => 'Single Room',
            'slug' => Str::random(10),
        ]);

        PropertyUnitType::create([
            'name' => 'One Bed Room',
            'description' => 'One Bed Room',
            'slug' => Str::random(10),
        ]);

        PropertyUnitType::create([
            'name' => 'Bed Sitter',
            'description' => 'Bed Sitter',
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
        Schema::dropIfExists('property_unit_types');
    }
};
