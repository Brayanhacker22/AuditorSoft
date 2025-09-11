<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('grf_trj_complementaria_producion', function (Blueprint $table) {
            $table->integer('ficha')->nullable();
            $table->string('fecha_reporte', 20)->nullable();
            $table->string('tipo_documento', 10)->nullable();
            $table->integer('numero_documento')->nullable();
            $table->string('nombre', 50)->nullable();
            $table->string('apellidos', 50)->nullable();
            $table->string('estado', 20)->nullable();
            $table->text('competencia')->nullable();
            $table->text('resultado_aprendizaje')->nullable();
            $table->string('juicio_evaluacion', 20)->nullable();
            $table->string('fecha_hora_juicio', 20)->nullable();
            $table->text('funcionario_registro')->nullable();
        });
    }

    public function down()
    {
        Schema::dropIfExists('grf_trj_complementaria_producion');
    }
};
