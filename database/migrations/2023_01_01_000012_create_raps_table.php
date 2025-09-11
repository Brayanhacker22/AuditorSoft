<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('raps', function (Blueprint $table) {
            $table->string('codigoDiseñoCompetenciaReporteRap')->primary();
            $table->string('codigoRapReporte');
            $table->text('nombreRap')->nullable();
            $table->decimal('horasDesarrolloRap', 10, 2)->nullable();

            $table->index('codigoRapReporte', 'idx_codigo_rap');
        });
    }

    public function down()
    {
        Schema::dropIfExists('raps');
    }
};
