<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('saldos_asignados', function (Blueprint $table) {
            $table->id('ID_SALDO');
            $table->string('NOMBRE_PERSONA', 255);
            $table->string('DOCUMENTO_PERSONA', 55);
            $table->timestamp('FECHA_REGISTRO')->useCurrent();
            $table->date('FECHA_INICIO');
            $table->date('FECHA_FIN');
            $table->date('FECHA_PAGO')->nullable();
            $table->decimal('SALDO_ASIGNADO', 15, 2);
            $table->string('rp_id', 55);
            $table->string('cdp_id', 55);

            $table->foreign('rp_id')
                  ->references('rp_id')
                  ->on('crp')
                  ->onDelete('cascade')
                  ->onUpdate('cascade');

            $table->foreign('cdp_id')
                  ->references('cdp_id')
                  ->on('cdp')
                  ->onDelete('cascade')
                  ->onUpdate('cascade');
        });
    }

    public function down()
    {
        Schema::dropIfExists('saldos_asignados');
    }
};
