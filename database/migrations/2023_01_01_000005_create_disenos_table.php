<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('diseños', function (Blueprint $table) {
            $table->string('codigoDiseño')->primary();
            $table->string('codigoPrograma');
            $table->string('versionPrograma');
            $table->string('nombrePrograma');
            $table->string('lineaTecnologica')->nullable();
            $table->string('redTecnologica')->nullable();
            $table->string('redConocimiento')->nullable();
            $table->decimal('horasDesarrolloLectiva', 10, 2)->nullable();
            $table->decimal('horasDesarrolloProductiva', 10, 2)->nullable();
            $table->decimal('mesesDesarrolloLectiva', 10, 2)->nullable();
            $table->decimal('mesesDesarrolloProductiva', 10, 2)->nullable();
            $table->decimal('horasDesarrolloDiseño', 10, 2)->nullable();
            $table->decimal('mesesDesarrolloDiseño', 10, 2)->nullable();
            $table->string('nivelAcademicoIngreso')->nullable();
            $table->integer('gradoNivelAcademico')->nullable();
            $table->enum('formacionTrabajoDesarrolloHumano', ['Si', 'No'])->nullable();
            $table->integer('edadMinima')->nullable();
            $table->text('requisitosAdicionales')->nullable();
        });
    }

    public function down()
    {
        Schema::dropIfExists('diseños');
    }
};
