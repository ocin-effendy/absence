<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('absence', function (Blueprint $table) {
            $table->id();
            $table->string('category');
            //latitude
            $table->string('latitude');
            //longitude
            $table->string('longitude');
            //radius_km
            $table->string('radius_m');
            //time_in (format: 08:00)
            $table->string('time_in');
            //time_out (format: 17:00)
            $table->string('time_out');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('absence');
    }
};
