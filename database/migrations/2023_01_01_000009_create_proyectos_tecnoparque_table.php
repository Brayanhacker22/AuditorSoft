<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('proyectos_tecnoparque', function (Blueprint $table) {
            $table->id('id_PBT');
            $table->enum('tipo', ['Tecnologico', 'Extensionismo']);
            $table->string('nombre_linea', 55);
            $table->integer('terminados')->nullable();
            $table->integer('en_proceso')->nullable();
            $table->timestamp('fecha_actualizacion')->useCurrent();
        });
    }

    public function down()
    {
        Schema::dropIfExists('proyectos_tecnoparque');
    }
};
