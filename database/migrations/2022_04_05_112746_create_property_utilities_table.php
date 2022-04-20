<?php

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;
use App\Models\Settings\Property\PropertyUtility;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('property_utilities', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('description')->nullable();
            $table->string('slug')->unique()->nullable();
            $table->timestamps();
        });

        PropertyUtility::create([
            'name' => 'Water',
            'description' => 'Water',
            'slug' => Str::random(10),
        ]);

        PropertyUtility::create([
            'name' => 'Gas',
            'description' => 'Gas',
            'slug' => Str::random(10),
        ]);

        PropertyUtility::create([
            'name' => 'Electricity',
            'description' => 'Electricity',
            'slug' => Str::random(10),
        ]);

        PropertyUtility::create([
            'name' => 'Internet/Wifi',
            'description' => 'Internet/Wifi',
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
        Schema::dropIfExists('property_utilities');
    }
};
