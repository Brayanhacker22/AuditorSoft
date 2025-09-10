<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('registros_actualizaciones', function (Blueprint $table) {
            $table->id();
            $table->enum('tipo_tabla', ['CDP', 'CRP', 'OP']);
            $table->string('nombre_archivo', 255);
            $table->timestamp('fecha_actualizacion')->useCurrent();
            $table->integer('registros_actualizados')->default(0);
            $table->integer('registros_nuevos')->default(0);
            $table->string('usuario_id', 79);

            $table->foreign('usuario_id')
                  ->references('numero_documento')
                  ->on('usuario');
        });
    }

    public function down()
    {
        Schema::dropIfExists('registros_actualizaciones');
    }
};
