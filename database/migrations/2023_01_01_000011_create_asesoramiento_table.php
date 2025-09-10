<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('asesoramiento', function (Blueprint $table) {
            $table->id('id_asesoramiento');
            $table->enum('tipo', ['Asociaciones', 'Cooperativa']);
            $table->string('encargadoAsesoramiento', 155);
            $table->string('nombreEntidadImpacto', 155);
            $table->datetime('fechaAsesoramiento');
            $table->timestamp('fecha_insert')->useCurrent();
        });
    }

    public function down()
    {
        Schema::dropIfExists('asesoramiento');
    }
};
