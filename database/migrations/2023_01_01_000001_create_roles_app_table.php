<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('roles_app', function (Blueprint $table) {
            $table->string('id_rol', 10)->primary();
            $table->string('nombre_rol', 100);
        });
    }

    public function down()
    {
        Schema::dropIfExists('roles_app');
    }
};
