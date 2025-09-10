<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('listadosvisitasApre', function (Blueprint $table) {
            $table->id('id_visita');
            $table->string('nodo', 100)->default('Cundinamarca');
            $table->string('encargado', 155);
            $table->integer('numAsistentes');
            $table->datetime('fechaCharla');
            $table->timestamp('fecha_insert')->useCurrent();
        });
    }

    public function down()
    {
        Schema::dropIfExists('listadosvisitasApre');
    }
};
