<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('imagenes_saldos_asignados', function (Blueprint $table) {
            $table->id('ID_IMAGEN');
            $table->unsignedBigInteger('ID_SALDO');
            $table->string('NOMBRE_ORIGINAL', 255);
            $table->string('RUTA_IMAGEN', 255);
            $table->timestamp('FECHA_SUBIDA')->useCurrent();

            $table->foreign('ID_SALDO')
                  ->references('ID_SALDO')
                  ->on('saldos_asignados')
                  ->onDelete('cascade')
                  ->onUpdate('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('imagenes_saldos_asignados');
    }
};
