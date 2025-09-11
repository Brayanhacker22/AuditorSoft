<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('competencias', function (Blueprint $table) {
            $table->string('codigoDiseñoCompetenciaReporte')->primary();
            $table->string('codigoCompetenciaReporte');
            $table->string('codigoCompetenciaPDF')->nullable();
            $table->string('nombreCompetencia');
            $table->text('normaUnidadCompetencia')->nullable();
            $table->decimal('horasDesarrolloCompetencia', 10, 2)->nullable();
            $table->text('requisitosAcademicosInstructor')->nullable();
            $table->text('experienciaLaboralInstructor')->nullable();

            $table->index('codigoCompetenciaReporte', 'idx_codigo_competencia');
        });
    }

    public function down()
    {
        Schema::dropIfExists('competencias');
    }
};
